# xv6_os_lab1

운영체제 수업 Lab 1 — xv6에 UNIX 스타일 시스템 콜 구현 실습

---

## 프로젝트 설명 및 목표

기존 xv6는 `exit()`와 `wait()`가 UNIX 표준과 달리 종료 상태(exit status)를 전달하지 않는다.  
본 실습에서는 UNIX 표준과 동일하게 동작하는 두 개의 시스템 콜을 직접 구현한다.

| 시스템 콜 | 설명 |
|---|---|
| `void exit2(int status)` | 종료 상태를 PCB에 저장하며 프로세스 종료 |
| `int wait2(int *status)` | 자식 프로세스의 종료 상태를 부모에게 전달 |

---

## 환경 세팅 방법

### 요구 사항
- Docker Desktop (Apple Silicon 지원 버전)
- macOS (M1/M2/M3/M4/M5)

### 1. Docker 컨테이너 생성 및 실행

```bash
docker run -it --platform linux/amd64 --name xv6-lab ubuntu:22.04 /bin/bash
```

### 2. 컨테이너 안에서 빌드 도구 설치

```bash
apt-get update && apt-get install -y git gcc make qemu-system-x86 gdb ovmf vim
```

### 3. 교수님 리포지토리 클론

```bash
git clone https://github.com/moonjupark/xv6edk2.git
cd xv6edk2
```

### 4. xv6 폴더를 이 리포지토리의 코드로 교체

```bash
rm -rf xv6
git clone https://github.com/본인아이디/xv6_os_lab1.git xv6
```

> `본인아이디` 부분을 실제 GitHub 아이디로 바꿔주세요.

---

## 빌드 및 실행 방법

### 1. 빌드

```bash
cd /xv6edk2/xv6
make
```

### 2. 디스크 이미지 생성

```bash
cp /xv6edk2/xv6/fs.img /xv6edk2/disk1.img
```

### 3. QEMU로 실행

```bash
cd /xv6edk2
qemu-system-x86_64 -bios /usr/share/ovmf/OVMF.fd \
  -drive if=ide,file=fat:rw:image,index=0,media=disk \
  -drive if=ide,file=/xv6edk2/disk1.img,index=1,media=disk,format=raw \
  -m 2048 -smp 4 \
  -serial mon:stdio \
  -nographic
```

### QEMU 종료

`Ctrl + A` 누른 후 `X` 입력

### 4. 테스트 프로그램 실행

xv6 셸(`$` 프롬프트)에서 아래 명령어를 실행한다.

```
id
test
```

---

## 구현한 시스템 콜 설명

### 수정한 파일 목록

| 파일 | 수정 내용 |
|---|---|
| `proc.h` | PCB(`struct proc`)에 `xstate` 필드 추가 |
| `syscall.h` | `SYS_exit2`(22), `SYS_wait2`(23) 번호 정의 |
| `user.h` | 유저용 함수 프로토타입 선언 |
| `defs.h` | 커널용 함수 프로토타입 선언 |
| `proc.c` | `exit2()`, `wait2()` 함수 본체 구현 |
| `sysproc.c` | `sys_exit2()`, `sys_wait2()` 핸들러 구현 |
| `syscall.c` | 시스템 콜 테이블에 등록 |
| `usys.S` | 어셈블리 매크로로 유저-커널 연결 |

### 동작 원리

```
유저 프로그램
    │  exit2(37) 호출
    ▼
usys.S (SYSCALL 매크로 → int $T_SYSCALL)
    │
    ▼
syscall.c (시스템 콜 테이블에서 sys_exit2 조회)
    │
    ▼
sysproc.c (sys_exit2: argint()로 인자 파싱)
    │
    ▼
proc.c (exit2: curproc->xstate = status 저장 → ZOMBIE 상태)
    │
    ▼
부모 프로세스가 wait2(&status) 호출 시 xstate 값 전달
```

### 추가한 파일

| 파일 | 설명 |
|---|---|
| `test.c` | fork/exit2/wait2 동작을 검증하는 테스트 프로그램 |
| `id.c` | 학번 출력 프로그램 |

---

## 실행 결과 예시

```
$ id
My ID is 20210000

$ test
This is the parent
This is the child
This is the parent
This is the child
This is the child
This is the child
This is the child
Child has finished: PID = 4
Child exited with code 37
```

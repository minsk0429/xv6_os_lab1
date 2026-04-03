
_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 24             	sub    $0x24,%esp
	int pid, child_pid;
	char *message;
	int n, status, exit_code;

	pid = fork();
  11:	e8 25 03 00 00       	call   33b <fork>
  16:	89 45 e8             	mov    %eax,-0x18(%ebp)
	switch(pid) {
  19:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%ebp)
  1d:	74 08                	je     27 <main+0x27>
  1f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  23:	74 1e                	je     43 <main+0x43>
  25:	eb 33                	jmp    5a <main+0x5a>
	case -1:
		printf(2, "fork failed");
  27:	83 ec 08             	sub    $0x8,%esp
  2a:	68 7e 08 00 00       	push   $0x87e
  2f:	6a 02                	push   $0x2
  31:	e8 91 04 00 00       	call   4c7 <printf>
  36:	83 c4 10             	add    $0x10,%esp
		exit2(0);
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	6a 00                	push   $0x0
  3e:	e8 10 03 00 00       	call   353 <exit2>
	case 0:
		message = "This is the child";
  43:	c7 45 f4 8a 08 00 00 	movl   $0x88a,-0xc(%ebp)
		n = 5;
  4a:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
		exit_code = 37;
  51:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
		break;
  58:	eb 16                	jmp    70 <main+0x70>
	default:
		message = "This is the parent";
  5a:	c7 45 f4 9c 08 00 00 	movl   $0x89c,-0xc(%ebp)
		n = 3;
  61:	c7 45 f0 03 00 00 00 	movl   $0x3,-0x10(%ebp)
		exit_code = 0;
  68:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		break;
  6f:	90                   	nop
	}
	for(; n > 0; n--) {
  70:	eb 26                	jmp    98 <main+0x98>
		printf(1, "%s\n", message);
  72:	83 ec 04             	sub    $0x4,%esp
  75:	ff 75 f4             	push   -0xc(%ebp)
  78:	68 af 08 00 00       	push   $0x8af
  7d:	6a 01                	push   $0x1
  7f:	e8 43 04 00 00       	call   4c7 <printf>
  84:	83 c4 10             	add    $0x10,%esp
		sleep(1);
  87:	83 ec 0c             	sub    $0xc,%esp
  8a:	6a 01                	push   $0x1
  8c:	e8 52 03 00 00       	call   3e3 <sleep>
  91:	83 c4 10             	add    $0x10,%esp
	for(; n > 0; n--) {
  94:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
  98:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  9c:	7f d4                	jg     72 <main+0x72>
	}
	if (pid != 0) {
  9e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  a2:	74 3d                	je     e1 <main+0xe1>
		child_pid = wait2(&status);
  a4:	83 ec 0c             	sub    $0xc,%esp
  a7:	8d 45 e0             	lea    -0x20(%ebp),%eax
  aa:	50                   	push   %eax
  ab:	e8 ab 02 00 00       	call   35b <wait2>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		printf(1, "Child has finished: PID = %d\n", child_pid);
  b6:	83 ec 04             	sub    $0x4,%esp
  b9:	ff 75 e4             	push   -0x1c(%ebp)
  bc:	68 b3 08 00 00       	push   $0x8b3
  c1:	6a 01                	push   $0x1
  c3:	e8 ff 03 00 00       	call   4c7 <printf>
  c8:	83 c4 10             	add    $0x10,%esp
		printf(1, "Child exited with code %d\n", status);
  cb:	8b 45 e0             	mov    -0x20(%ebp),%eax
  ce:	83 ec 04             	sub    $0x4,%esp
  d1:	50                   	push   %eax
  d2:	68 d1 08 00 00       	push   $0x8d1
  d7:	6a 01                	push   $0x1
  d9:	e8 e9 03 00 00       	call   4c7 <printf>
  de:	83 c4 10             	add    $0x10,%esp
	}
	exit2(exit_code);
  e1:	83 ec 0c             	sub    $0xc,%esp
  e4:	ff 75 ec             	push   -0x14(%ebp)
  e7:	e8 67 02 00 00       	call   353 <exit2>

000000ec <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  ec:	55                   	push   %ebp
  ed:	89 e5                	mov    %esp,%ebp
  ef:	57                   	push   %edi
  f0:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  f1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f4:	8b 55 10             	mov    0x10(%ebp),%edx
  f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  fa:	89 cb                	mov    %ecx,%ebx
  fc:	89 df                	mov    %ebx,%edi
  fe:	89 d1                	mov    %edx,%ecx
 100:	fc                   	cld    
 101:	f3 aa                	rep stos %al,%es:(%edi)
 103:	89 ca                	mov    %ecx,%edx
 105:	89 fb                	mov    %edi,%ebx
 107:	89 5d 08             	mov    %ebx,0x8(%ebp)
 10a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 10d:	90                   	nop
 10e:	5b                   	pop    %ebx
 10f:	5f                   	pop    %edi
 110:	5d                   	pop    %ebp
 111:	c3                   	ret    

00000112 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 112:	55                   	push   %ebp
 113:	89 e5                	mov    %esp,%ebp
 115:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 118:	8b 45 08             	mov    0x8(%ebp),%eax
 11b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 11e:	90                   	nop
 11f:	8b 55 0c             	mov    0xc(%ebp),%edx
 122:	8d 42 01             	lea    0x1(%edx),%eax
 125:	89 45 0c             	mov    %eax,0xc(%ebp)
 128:	8b 45 08             	mov    0x8(%ebp),%eax
 12b:	8d 48 01             	lea    0x1(%eax),%ecx
 12e:	89 4d 08             	mov    %ecx,0x8(%ebp)
 131:	0f b6 12             	movzbl (%edx),%edx
 134:	88 10                	mov    %dl,(%eax)
 136:	0f b6 00             	movzbl (%eax),%eax
 139:	84 c0                	test   %al,%al
 13b:	75 e2                	jne    11f <strcpy+0xd>
    ;
  return os;
 13d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 140:	c9                   	leave  
 141:	c3                   	ret    

00000142 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 142:	55                   	push   %ebp
 143:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 145:	eb 08                	jmp    14f <strcmp+0xd>
    p++, q++;
 147:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 14b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 14f:	8b 45 08             	mov    0x8(%ebp),%eax
 152:	0f b6 00             	movzbl (%eax),%eax
 155:	84 c0                	test   %al,%al
 157:	74 10                	je     169 <strcmp+0x27>
 159:	8b 45 08             	mov    0x8(%ebp),%eax
 15c:	0f b6 10             	movzbl (%eax),%edx
 15f:	8b 45 0c             	mov    0xc(%ebp),%eax
 162:	0f b6 00             	movzbl (%eax),%eax
 165:	38 c2                	cmp    %al,%dl
 167:	74 de                	je     147 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 169:	8b 45 08             	mov    0x8(%ebp),%eax
 16c:	0f b6 00             	movzbl (%eax),%eax
 16f:	0f b6 d0             	movzbl %al,%edx
 172:	8b 45 0c             	mov    0xc(%ebp),%eax
 175:	0f b6 00             	movzbl (%eax),%eax
 178:	0f b6 c8             	movzbl %al,%ecx
 17b:	89 d0                	mov    %edx,%eax
 17d:	29 c8                	sub    %ecx,%eax
}
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    

00000181 <strlen>:

uint
strlen(char *s)
{
 181:	55                   	push   %ebp
 182:	89 e5                	mov    %esp,%ebp
 184:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 187:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 18e:	eb 04                	jmp    194 <strlen+0x13>
 190:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 194:	8b 55 fc             	mov    -0x4(%ebp),%edx
 197:	8b 45 08             	mov    0x8(%ebp),%eax
 19a:	01 d0                	add    %edx,%eax
 19c:	0f b6 00             	movzbl (%eax),%eax
 19f:	84 c0                	test   %al,%al
 1a1:	75 ed                	jne    190 <strlen+0xf>
    ;
  return n;
 1a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1a6:	c9                   	leave  
 1a7:	c3                   	ret    

000001a8 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 1ab:	8b 45 10             	mov    0x10(%ebp),%eax
 1ae:	50                   	push   %eax
 1af:	ff 75 0c             	push   0xc(%ebp)
 1b2:	ff 75 08             	push   0x8(%ebp)
 1b5:	e8 32 ff ff ff       	call   ec <stosb>
 1ba:	83 c4 0c             	add    $0xc,%esp
  return dst;
 1bd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1c0:	c9                   	leave  
 1c1:	c3                   	ret    

000001c2 <strchr>:

char*
strchr(const char *s, char c)
{
 1c2:	55                   	push   %ebp
 1c3:	89 e5                	mov    %esp,%ebp
 1c5:	83 ec 04             	sub    $0x4,%esp
 1c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cb:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1ce:	eb 14                	jmp    1e4 <strchr+0x22>
    if(*s == c)
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
 1d3:	0f b6 00             	movzbl (%eax),%eax
 1d6:	38 45 fc             	cmp    %al,-0x4(%ebp)
 1d9:	75 05                	jne    1e0 <strchr+0x1e>
      return (char*)s;
 1db:	8b 45 08             	mov    0x8(%ebp),%eax
 1de:	eb 13                	jmp    1f3 <strchr+0x31>
  for(; *s; s++)
 1e0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	0f b6 00             	movzbl (%eax),%eax
 1ea:	84 c0                	test   %al,%al
 1ec:	75 e2                	jne    1d0 <strchr+0xe>
  return 0;
 1ee:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1f3:	c9                   	leave  
 1f4:	c3                   	ret    

000001f5 <gets>:

char*
gets(char *buf, int max)
{
 1f5:	55                   	push   %ebp
 1f6:	89 e5                	mov    %esp,%ebp
 1f8:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 202:	eb 42                	jmp    246 <gets+0x51>
    cc = read(0, &c, 1);
 204:	83 ec 04             	sub    $0x4,%esp
 207:	6a 01                	push   $0x1
 209:	8d 45 ef             	lea    -0x11(%ebp),%eax
 20c:	50                   	push   %eax
 20d:	6a 00                	push   $0x0
 20f:	e8 57 01 00 00       	call   36b <read>
 214:	83 c4 10             	add    $0x10,%esp
 217:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 21a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 21e:	7e 33                	jle    253 <gets+0x5e>
      break;
    buf[i++] = c;
 220:	8b 45 f4             	mov    -0xc(%ebp),%eax
 223:	8d 50 01             	lea    0x1(%eax),%edx
 226:	89 55 f4             	mov    %edx,-0xc(%ebp)
 229:	89 c2                	mov    %eax,%edx
 22b:	8b 45 08             	mov    0x8(%ebp),%eax
 22e:	01 c2                	add    %eax,%edx
 230:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 234:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 236:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 23a:	3c 0a                	cmp    $0xa,%al
 23c:	74 16                	je     254 <gets+0x5f>
 23e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 242:	3c 0d                	cmp    $0xd,%al
 244:	74 0e                	je     254 <gets+0x5f>
  for(i=0; i+1 < max; ){
 246:	8b 45 f4             	mov    -0xc(%ebp),%eax
 249:	83 c0 01             	add    $0x1,%eax
 24c:	39 45 0c             	cmp    %eax,0xc(%ebp)
 24f:	7f b3                	jg     204 <gets+0xf>
 251:	eb 01                	jmp    254 <gets+0x5f>
      break;
 253:	90                   	nop
      break;
  }
  buf[i] = '\0';
 254:	8b 55 f4             	mov    -0xc(%ebp),%edx
 257:	8b 45 08             	mov    0x8(%ebp),%eax
 25a:	01 d0                	add    %edx,%eax
 25c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 262:	c9                   	leave  
 263:	c3                   	ret    

00000264 <stat>:

int
stat(char *n, struct stat *st)
{
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 26a:	83 ec 08             	sub    $0x8,%esp
 26d:	6a 00                	push   $0x0
 26f:	ff 75 08             	push   0x8(%ebp)
 272:	e8 1c 01 00 00       	call   393 <open>
 277:	83 c4 10             	add    $0x10,%esp
 27a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 27d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 281:	79 07                	jns    28a <stat+0x26>
    return -1;
 283:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 288:	eb 25                	jmp    2af <stat+0x4b>
  r = fstat(fd, st);
 28a:	83 ec 08             	sub    $0x8,%esp
 28d:	ff 75 0c             	push   0xc(%ebp)
 290:	ff 75 f4             	push   -0xc(%ebp)
 293:	e8 13 01 00 00       	call   3ab <fstat>
 298:	83 c4 10             	add    $0x10,%esp
 29b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 29e:	83 ec 0c             	sub    $0xc,%esp
 2a1:	ff 75 f4             	push   -0xc(%ebp)
 2a4:	e8 d2 00 00 00       	call   37b <close>
 2a9:	83 c4 10             	add    $0x10,%esp
  return r;
 2ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2af:	c9                   	leave  
 2b0:	c3                   	ret    

000002b1 <atoi>:

int
atoi(const char *s)
{
 2b1:	55                   	push   %ebp
 2b2:	89 e5                	mov    %esp,%ebp
 2b4:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2b7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2be:	eb 25                	jmp    2e5 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2c0:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2c3:	89 d0                	mov    %edx,%eax
 2c5:	c1 e0 02             	shl    $0x2,%eax
 2c8:	01 d0                	add    %edx,%eax
 2ca:	01 c0                	add    %eax,%eax
 2cc:	89 c1                	mov    %eax,%ecx
 2ce:	8b 45 08             	mov    0x8(%ebp),%eax
 2d1:	8d 50 01             	lea    0x1(%eax),%edx
 2d4:	89 55 08             	mov    %edx,0x8(%ebp)
 2d7:	0f b6 00             	movzbl (%eax),%eax
 2da:	0f be c0             	movsbl %al,%eax
 2dd:	01 c8                	add    %ecx,%eax
 2df:	83 e8 30             	sub    $0x30,%eax
 2e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2e5:	8b 45 08             	mov    0x8(%ebp),%eax
 2e8:	0f b6 00             	movzbl (%eax),%eax
 2eb:	3c 2f                	cmp    $0x2f,%al
 2ed:	7e 0a                	jle    2f9 <atoi+0x48>
 2ef:	8b 45 08             	mov    0x8(%ebp),%eax
 2f2:	0f b6 00             	movzbl (%eax),%eax
 2f5:	3c 39                	cmp    $0x39,%al
 2f7:	7e c7                	jle    2c0 <atoi+0xf>
  return n;
 2f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2fc:	c9                   	leave  
 2fd:	c3                   	ret    

000002fe <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2fe:	55                   	push   %ebp
 2ff:	89 e5                	mov    %esp,%ebp
 301:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;

  dst = vdst;
 304:	8b 45 08             	mov    0x8(%ebp),%eax
 307:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 30a:	8b 45 0c             	mov    0xc(%ebp),%eax
 30d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 310:	eb 17                	jmp    329 <memmove+0x2b>
    *dst++ = *src++;
 312:	8b 55 f8             	mov    -0x8(%ebp),%edx
 315:	8d 42 01             	lea    0x1(%edx),%eax
 318:	89 45 f8             	mov    %eax,-0x8(%ebp)
 31b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 31e:	8d 48 01             	lea    0x1(%eax),%ecx
 321:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 324:	0f b6 12             	movzbl (%edx),%edx
 327:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 329:	8b 45 10             	mov    0x10(%ebp),%eax
 32c:	8d 50 ff             	lea    -0x1(%eax),%edx
 32f:	89 55 10             	mov    %edx,0x10(%ebp)
 332:	85 c0                	test   %eax,%eax
 334:	7f dc                	jg     312 <memmove+0x14>
  return vdst;
 336:	8b 45 08             	mov    0x8(%ebp),%eax
}
 339:	c9                   	leave  
 33a:	c3                   	ret    

0000033b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33b:	b8 01 00 00 00       	mov    $0x1,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <exit>:
SYSCALL(exit)
 343:	b8 02 00 00 00       	mov    $0x2,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <wait>:
SYSCALL(wait)
 34b:	b8 03 00 00 00       	mov    $0x3,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <exit2>:
SYSCALL(exit2)
 353:	b8 16 00 00 00       	mov    $0x16,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <wait2>:
SYSCALL(wait2)
 35b:	b8 17 00 00 00       	mov    $0x17,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <pipe>:
SYSCALL(pipe)
 363:	b8 04 00 00 00       	mov    $0x4,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <read>:
SYSCALL(read)
 36b:	b8 05 00 00 00       	mov    $0x5,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <write>:
SYSCALL(write)
 373:	b8 10 00 00 00       	mov    $0x10,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <close>:
SYSCALL(close)
 37b:	b8 15 00 00 00       	mov    $0x15,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <kill>:
SYSCALL(kill)
 383:	b8 06 00 00 00       	mov    $0x6,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <exec>:
SYSCALL(exec)
 38b:	b8 07 00 00 00       	mov    $0x7,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <open>:
SYSCALL(open)
 393:	b8 0f 00 00 00       	mov    $0xf,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <mknod>:
SYSCALL(mknod)
 39b:	b8 11 00 00 00       	mov    $0x11,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <unlink>:
SYSCALL(unlink)
 3a3:	b8 12 00 00 00       	mov    $0x12,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <fstat>:
SYSCALL(fstat)
 3ab:	b8 08 00 00 00       	mov    $0x8,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <link>:
SYSCALL(link)
 3b3:	b8 13 00 00 00       	mov    $0x13,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <mkdir>:
SYSCALL(mkdir)
 3bb:	b8 14 00 00 00       	mov    $0x14,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <chdir>:
SYSCALL(chdir)
 3c3:	b8 09 00 00 00       	mov    $0x9,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <dup>:
SYSCALL(dup)
 3cb:	b8 0a 00 00 00       	mov    $0xa,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <getpid>:
SYSCALL(getpid)
 3d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <sbrk>:
SYSCALL(sbrk)
 3db:	b8 0c 00 00 00       	mov    $0xc,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <sleep>:
SYSCALL(sleep)
 3e3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <uptime>:
SYSCALL(uptime)
 3eb:	b8 0e 00 00 00       	mov    $0xe,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	83 ec 18             	sub    $0x18,%esp
 3f9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fc:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3ff:	83 ec 04             	sub    $0x4,%esp
 402:	6a 01                	push   $0x1
 404:	8d 45 f4             	lea    -0xc(%ebp),%eax
 407:	50                   	push   %eax
 408:	ff 75 08             	push   0x8(%ebp)
 40b:	e8 63 ff ff ff       	call   373 <write>
 410:	83 c4 10             	add    $0x10,%esp
}
 413:	90                   	nop
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 41c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 423:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 427:	74 17                	je     440 <printint+0x2a>
 429:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 42d:	79 11                	jns    440 <printint+0x2a>
    neg = 1;
 42f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 436:	8b 45 0c             	mov    0xc(%ebp),%eax
 439:	f7 d8                	neg    %eax
 43b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 43e:	eb 06                	jmp    446 <printint+0x30>
  } else {
    x = xx;
 440:	8b 45 0c             	mov    0xc(%ebp),%eax
 443:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 446:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 44d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 450:	8b 45 ec             	mov    -0x14(%ebp),%eax
 453:	ba 00 00 00 00       	mov    $0x0,%edx
 458:	f7 f1                	div    %ecx
 45a:	89 d1                	mov    %edx,%ecx
 45c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 45f:	8d 50 01             	lea    0x1(%eax),%edx
 462:	89 55 f4             	mov    %edx,-0xc(%ebp)
 465:	0f b6 91 38 0b 00 00 	movzbl 0xb38(%ecx),%edx
 46c:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
  }while((x /= base) != 0);
 470:	8b 4d 10             	mov    0x10(%ebp),%ecx
 473:	8b 45 ec             	mov    -0x14(%ebp),%eax
 476:	ba 00 00 00 00       	mov    $0x0,%edx
 47b:	f7 f1                	div    %ecx
 47d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 480:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 484:	75 c7                	jne    44d <printint+0x37>
  if(neg)
 486:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 48a:	74 2d                	je     4b9 <printint+0xa3>
    buf[i++] = '-';
 48c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 48f:	8d 50 01             	lea    0x1(%eax),%edx
 492:	89 55 f4             	mov    %edx,-0xc(%ebp)
 495:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 49a:	eb 1d                	jmp    4b9 <printint+0xa3>
    putc(fd, buf[i]);
 49c:	8d 55 dc             	lea    -0x24(%ebp),%edx
 49f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a2:	01 d0                	add    %edx,%eax
 4a4:	0f b6 00             	movzbl (%eax),%eax
 4a7:	0f be c0             	movsbl %al,%eax
 4aa:	83 ec 08             	sub    $0x8,%esp
 4ad:	50                   	push   %eax
 4ae:	ff 75 08             	push   0x8(%ebp)
 4b1:	e8 3d ff ff ff       	call   3f3 <putc>
 4b6:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
 4b9:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4bd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4c1:	79 d9                	jns    49c <printint+0x86>
}
 4c3:	90                   	nop
 4c4:	90                   	nop
 4c5:	c9                   	leave  
 4c6:	c3                   	ret    

000004c7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4c7:	55                   	push   %ebp
 4c8:	89 e5                	mov    %esp,%ebp
 4ca:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4cd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4d4:	8d 45 0c             	lea    0xc(%ebp),%eax
 4d7:	83 c0 04             	add    $0x4,%eax
 4da:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4dd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4e4:	e9 59 01 00 00       	jmp    642 <printf+0x17b>
    c = fmt[i] & 0xff;
 4e9:	8b 55 0c             	mov    0xc(%ebp),%edx
 4ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4ef:	01 d0                	add    %edx,%eax
 4f1:	0f b6 00             	movzbl (%eax),%eax
 4f4:	0f be c0             	movsbl %al,%eax
 4f7:	25 ff 00 00 00       	and    $0xff,%eax
 4fc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4ff:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 503:	75 2c                	jne    531 <printf+0x6a>
      if(c == '%'){
 505:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 509:	75 0c                	jne    517 <printf+0x50>
        state = '%';
 50b:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 512:	e9 27 01 00 00       	jmp    63e <printf+0x177>
      } else {
        putc(fd, c);
 517:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 51a:	0f be c0             	movsbl %al,%eax
 51d:	83 ec 08             	sub    $0x8,%esp
 520:	50                   	push   %eax
 521:	ff 75 08             	push   0x8(%ebp)
 524:	e8 ca fe ff ff       	call   3f3 <putc>
 529:	83 c4 10             	add    $0x10,%esp
 52c:	e9 0d 01 00 00       	jmp    63e <printf+0x177>
      }
    } else if(state == '%'){
 531:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 535:	0f 85 03 01 00 00    	jne    63e <printf+0x177>
      if(c == 'd'){
 53b:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 53f:	75 1e                	jne    55f <printf+0x98>
        printint(fd, *ap, 10, 1);
 541:	8b 45 e8             	mov    -0x18(%ebp),%eax
 544:	8b 00                	mov    (%eax),%eax
 546:	6a 01                	push   $0x1
 548:	6a 0a                	push   $0xa
 54a:	50                   	push   %eax
 54b:	ff 75 08             	push   0x8(%ebp)
 54e:	e8 c3 fe ff ff       	call   416 <printint>
 553:	83 c4 10             	add    $0x10,%esp
        ap++;
 556:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 55a:	e9 d8 00 00 00       	jmp    637 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 55f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 563:	74 06                	je     56b <printf+0xa4>
 565:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 569:	75 1e                	jne    589 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 56b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 56e:	8b 00                	mov    (%eax),%eax
 570:	6a 00                	push   $0x0
 572:	6a 10                	push   $0x10
 574:	50                   	push   %eax
 575:	ff 75 08             	push   0x8(%ebp)
 578:	e8 99 fe ff ff       	call   416 <printint>
 57d:	83 c4 10             	add    $0x10,%esp
        ap++;
 580:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 584:	e9 ae 00 00 00       	jmp    637 <printf+0x170>
      } else if(c == 's'){
 589:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 58d:	75 43                	jne    5d2 <printf+0x10b>
        s = (char*)*ap;
 58f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 592:	8b 00                	mov    (%eax),%eax
 594:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 597:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 59b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 59f:	75 25                	jne    5c6 <printf+0xff>
          s = "(null)";
 5a1:	c7 45 f4 ec 08 00 00 	movl   $0x8ec,-0xc(%ebp)
        while(*s != 0){
 5a8:	eb 1c                	jmp    5c6 <printf+0xff>
          putc(fd, *s);
 5aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ad:	0f b6 00             	movzbl (%eax),%eax
 5b0:	0f be c0             	movsbl %al,%eax
 5b3:	83 ec 08             	sub    $0x8,%esp
 5b6:	50                   	push   %eax
 5b7:	ff 75 08             	push   0x8(%ebp)
 5ba:	e8 34 fe ff ff       	call   3f3 <putc>
 5bf:	83 c4 10             	add    $0x10,%esp
          s++;
 5c2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 5c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5c9:	0f b6 00             	movzbl (%eax),%eax
 5cc:	84 c0                	test   %al,%al
 5ce:	75 da                	jne    5aa <printf+0xe3>
 5d0:	eb 65                	jmp    637 <printf+0x170>
        }
      } else if(c == 'c'){
 5d2:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5d6:	75 1d                	jne    5f5 <printf+0x12e>
        putc(fd, *ap);
 5d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5db:	8b 00                	mov    (%eax),%eax
 5dd:	0f be c0             	movsbl %al,%eax
 5e0:	83 ec 08             	sub    $0x8,%esp
 5e3:	50                   	push   %eax
 5e4:	ff 75 08             	push   0x8(%ebp)
 5e7:	e8 07 fe ff ff       	call   3f3 <putc>
 5ec:	83 c4 10             	add    $0x10,%esp
        ap++;
 5ef:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5f3:	eb 42                	jmp    637 <printf+0x170>
      } else if(c == '%'){
 5f5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5f9:	75 17                	jne    612 <printf+0x14b>
        putc(fd, c);
 5fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5fe:	0f be c0             	movsbl %al,%eax
 601:	83 ec 08             	sub    $0x8,%esp
 604:	50                   	push   %eax
 605:	ff 75 08             	push   0x8(%ebp)
 608:	e8 e6 fd ff ff       	call   3f3 <putc>
 60d:	83 c4 10             	add    $0x10,%esp
 610:	eb 25                	jmp    637 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 612:	83 ec 08             	sub    $0x8,%esp
 615:	6a 25                	push   $0x25
 617:	ff 75 08             	push   0x8(%ebp)
 61a:	e8 d4 fd ff ff       	call   3f3 <putc>
 61f:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 622:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 625:	0f be c0             	movsbl %al,%eax
 628:	83 ec 08             	sub    $0x8,%esp
 62b:	50                   	push   %eax
 62c:	ff 75 08             	push   0x8(%ebp)
 62f:	e8 bf fd ff ff       	call   3f3 <putc>
 634:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 637:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 63e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 642:	8b 55 0c             	mov    0xc(%ebp),%edx
 645:	8b 45 f0             	mov    -0x10(%ebp),%eax
 648:	01 d0                	add    %edx,%eax
 64a:	0f b6 00             	movzbl (%eax),%eax
 64d:	84 c0                	test   %al,%al
 64f:	0f 85 94 fe ff ff    	jne    4e9 <printf+0x22>
    }
  }
}
 655:	90                   	nop
 656:	90                   	nop
 657:	c9                   	leave  
 658:	c3                   	ret    

00000659 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 659:	55                   	push   %ebp
 65a:	89 e5                	mov    %esp,%ebp
 65c:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 65f:	8b 45 08             	mov    0x8(%ebp),%eax
 662:	83 e8 08             	sub    $0x8,%eax
 665:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 668:	a1 54 0b 00 00       	mov    0xb54,%eax
 66d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 670:	eb 24                	jmp    696 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 672:	8b 45 fc             	mov    -0x4(%ebp),%eax
 675:	8b 00                	mov    (%eax),%eax
 677:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 67a:	72 12                	jb     68e <free+0x35>
 67c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 682:	77 24                	ja     6a8 <free+0x4f>
 684:	8b 45 fc             	mov    -0x4(%ebp),%eax
 687:	8b 00                	mov    (%eax),%eax
 689:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 68c:	72 1a                	jb     6a8 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 68e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 691:	8b 00                	mov    (%eax),%eax
 693:	89 45 fc             	mov    %eax,-0x4(%ebp)
 696:	8b 45 f8             	mov    -0x8(%ebp),%eax
 699:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 69c:	76 d4                	jbe    672 <free+0x19>
 69e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a1:	8b 00                	mov    (%eax),%eax
 6a3:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 6a6:	73 ca                	jae    672 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ab:	8b 40 04             	mov    0x4(%eax),%eax
 6ae:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b8:	01 c2                	add    %eax,%edx
 6ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bd:	8b 00                	mov    (%eax),%eax
 6bf:	39 c2                	cmp    %eax,%edx
 6c1:	75 24                	jne    6e7 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6c3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c6:	8b 50 04             	mov    0x4(%eax),%edx
 6c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cc:	8b 00                	mov    (%eax),%eax
 6ce:	8b 40 04             	mov    0x4(%eax),%eax
 6d1:	01 c2                	add    %eax,%edx
 6d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d6:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6dc:	8b 00                	mov    (%eax),%eax
 6de:	8b 10                	mov    (%eax),%edx
 6e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e3:	89 10                	mov    %edx,(%eax)
 6e5:	eb 0a                	jmp    6f1 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ea:	8b 10                	mov    (%eax),%edx
 6ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ef:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f4:	8b 40 04             	mov    0x4(%eax),%eax
 6f7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 701:	01 d0                	add    %edx,%eax
 703:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 706:	75 20                	jne    728 <free+0xcf>
    p->s.size += bp->s.size;
 708:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70b:	8b 50 04             	mov    0x4(%eax),%edx
 70e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 711:	8b 40 04             	mov    0x4(%eax),%eax
 714:	01 c2                	add    %eax,%edx
 716:	8b 45 fc             	mov    -0x4(%ebp),%eax
 719:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 71c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71f:	8b 10                	mov    (%eax),%edx
 721:	8b 45 fc             	mov    -0x4(%ebp),%eax
 724:	89 10                	mov    %edx,(%eax)
 726:	eb 08                	jmp    730 <free+0xd7>
  } else
    p->s.ptr = bp;
 728:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 72e:	89 10                	mov    %edx,(%eax)
  freep = p;
 730:	8b 45 fc             	mov    -0x4(%ebp),%eax
 733:	a3 54 0b 00 00       	mov    %eax,0xb54
}
 738:	90                   	nop
 739:	c9                   	leave  
 73a:	c3                   	ret    

0000073b <morecore>:

static Header*
morecore(uint nu)
{
 73b:	55                   	push   %ebp
 73c:	89 e5                	mov    %esp,%ebp
 73e:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 741:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 748:	77 07                	ja     751 <morecore+0x16>
    nu = 4096;
 74a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 751:	8b 45 08             	mov    0x8(%ebp),%eax
 754:	c1 e0 03             	shl    $0x3,%eax
 757:	83 ec 0c             	sub    $0xc,%esp
 75a:	50                   	push   %eax
 75b:	e8 7b fc ff ff       	call   3db <sbrk>
 760:	83 c4 10             	add    $0x10,%esp
 763:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 766:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 76a:	75 07                	jne    773 <morecore+0x38>
    return 0;
 76c:	b8 00 00 00 00       	mov    $0x0,%eax
 771:	eb 26                	jmp    799 <morecore+0x5e>
  hp = (Header*)p;
 773:	8b 45 f4             	mov    -0xc(%ebp),%eax
 776:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 779:	8b 45 f0             	mov    -0x10(%ebp),%eax
 77c:	8b 55 08             	mov    0x8(%ebp),%edx
 77f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 782:	8b 45 f0             	mov    -0x10(%ebp),%eax
 785:	83 c0 08             	add    $0x8,%eax
 788:	83 ec 0c             	sub    $0xc,%esp
 78b:	50                   	push   %eax
 78c:	e8 c8 fe ff ff       	call   659 <free>
 791:	83 c4 10             	add    $0x10,%esp
  return freep;
 794:	a1 54 0b 00 00       	mov    0xb54,%eax
}
 799:	c9                   	leave  
 79a:	c3                   	ret    

0000079b <malloc>:

void*
malloc(uint nbytes)
{
 79b:	55                   	push   %ebp
 79c:	89 e5                	mov    %esp,%ebp
 79e:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a1:	8b 45 08             	mov    0x8(%ebp),%eax
 7a4:	83 c0 07             	add    $0x7,%eax
 7a7:	c1 e8 03             	shr    $0x3,%eax
 7aa:	83 c0 01             	add    $0x1,%eax
 7ad:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7b0:	a1 54 0b 00 00       	mov    0xb54,%eax
 7b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7bc:	75 23                	jne    7e1 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7be:	c7 45 f0 4c 0b 00 00 	movl   $0xb4c,-0x10(%ebp)
 7c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c8:	a3 54 0b 00 00       	mov    %eax,0xb54
 7cd:	a1 54 0b 00 00       	mov    0xb54,%eax
 7d2:	a3 4c 0b 00 00       	mov    %eax,0xb4c
    base.s.size = 0;
 7d7:	c7 05 50 0b 00 00 00 	movl   $0x0,0xb50
 7de:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e4:	8b 00                	mov    (%eax),%eax
 7e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ec:	8b 40 04             	mov    0x4(%eax),%eax
 7ef:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 7f2:	77 4d                	ja     841 <malloc+0xa6>
      if(p->s.size == nunits)
 7f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f7:	8b 40 04             	mov    0x4(%eax),%eax
 7fa:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 7fd:	75 0c                	jne    80b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 802:	8b 10                	mov    (%eax),%edx
 804:	8b 45 f0             	mov    -0x10(%ebp),%eax
 807:	89 10                	mov    %edx,(%eax)
 809:	eb 26                	jmp    831 <malloc+0x96>
      else {
        p->s.size -= nunits;
 80b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80e:	8b 40 04             	mov    0x4(%eax),%eax
 811:	2b 45 ec             	sub    -0x14(%ebp),%eax
 814:	89 c2                	mov    %eax,%edx
 816:	8b 45 f4             	mov    -0xc(%ebp),%eax
 819:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 81c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81f:	8b 40 04             	mov    0x4(%eax),%eax
 822:	c1 e0 03             	shl    $0x3,%eax
 825:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 828:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82b:	8b 55 ec             	mov    -0x14(%ebp),%edx
 82e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 831:	8b 45 f0             	mov    -0x10(%ebp),%eax
 834:	a3 54 0b 00 00       	mov    %eax,0xb54
      return (void*)(p + 1);
 839:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83c:	83 c0 08             	add    $0x8,%eax
 83f:	eb 3b                	jmp    87c <malloc+0xe1>
    }
    if(p == freep)
 841:	a1 54 0b 00 00       	mov    0xb54,%eax
 846:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 849:	75 1e                	jne    869 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 84b:	83 ec 0c             	sub    $0xc,%esp
 84e:	ff 75 ec             	push   -0x14(%ebp)
 851:	e8 e5 fe ff ff       	call   73b <morecore>
 856:	83 c4 10             	add    $0x10,%esp
 859:	89 45 f4             	mov    %eax,-0xc(%ebp)
 85c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 860:	75 07                	jne    869 <malloc+0xce>
        return 0;
 862:	b8 00 00 00 00       	mov    $0x0,%eax
 867:	eb 13                	jmp    87c <malloc+0xe1>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 869:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 86f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 872:	8b 00                	mov    (%eax),%eax
 874:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 877:	e9 6d ff ff ff       	jmp    7e9 <malloc+0x4e>
  }
}
 87c:	c9                   	leave  
 87d:	c3                   	ret    

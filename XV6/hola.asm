
_hola:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

#include "types.h"
#include "user.h"
int main(int argc,char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	53                   	push   %ebx
  printf(1,"Hola Mundo!\n");
   7:	bb 02 00 00 00       	mov    $0x2,%ebx

#include "types.h"
#include "user.h"
int main(int argc,char *argv[])
{
   c:	83 ec 1c             	sub    $0x1c,%esp
  printf(1,"Hola Mundo!\n");
   f:	c7 44 24 04 3e 07 00 	movl   $0x73e,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 9d 03 00 00       	call   3c0 <printf>
  23:	90                   	nop
  24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  /*return 0;*/
int x;
for( x=2;x<=20;x++){
printf(1,"Hola Mundo!  %d\n",x);
  28:	89 5c 24 08          	mov    %ebx,0x8(%esp)
int main(int argc,char *argv[])
{
  printf(1,"Hola Mundo!\n");
  /*return 0;*/
int x;
for( x=2;x<=20;x++){
  2c:	83 c3 01             	add    $0x1,%ebx
printf(1,"Hola Mundo!  %d\n",x);
  2f:	c7 44 24 04 4b 07 00 	movl   $0x74b,0x4(%esp)
  36:	00 
  37:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3e:	e8 7d 03 00 00       	call   3c0 <printf>
int main(int argc,char *argv[])
{
  printf(1,"Hola Mundo!\n");
  /*return 0;*/
int x;
for( x=2;x<=20;x++){
  43:	83 fb 15             	cmp    $0x15,%ebx
  46:	75 e0                	jne    28 <main+0x28>
printf(1,"Hola Mundo!  %d\n",x);
}  


exit();
  48:	e8 2b 02 00 00       	call   278 <exit>
  4d:	90                   	nop
  4e:	90                   	nop
  4f:	90                   	nop

00000050 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  50:	55                   	push   %ebp
  51:	31 d2                	xor    %edx,%edx
  53:	89 e5                	mov    %esp,%ebp
  55:	8b 45 08             	mov    0x8(%ebp),%eax
  58:	53                   	push   %ebx
  59:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  60:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  64:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  67:	83 c2 01             	add    $0x1,%edx
  6a:	84 c9                	test   %cl,%cl
  6c:	75 f2                	jne    60 <strcpy+0x10>
    ;
  return os;
}
  6e:	5b                   	pop    %ebx
  6f:	5d                   	pop    %ebp
  70:	c3                   	ret    
  71:	eb 0d                	jmp    80 <strcmp>
  73:	90                   	nop
  74:	90                   	nop
  75:	90                   	nop
  76:	90                   	nop
  77:	90                   	nop
  78:	90                   	nop
  79:	90                   	nop
  7a:	90                   	nop
  7b:	90                   	nop
  7c:	90                   	nop
  7d:	90                   	nop
  7e:	90                   	nop
  7f:	90                   	nop

00000080 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	53                   	push   %ebx
  84:	8b 4d 08             	mov    0x8(%ebp),%ecx
  87:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  8a:	0f b6 01             	movzbl (%ecx),%eax
  8d:	84 c0                	test   %al,%al
  8f:	75 14                	jne    a5 <strcmp+0x25>
  91:	eb 25                	jmp    b8 <strcmp+0x38>
  93:	90                   	nop
  94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
  98:	83 c1 01             	add    $0x1,%ecx
  9b:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  9e:	0f b6 01             	movzbl (%ecx),%eax
  a1:	84 c0                	test   %al,%al
  a3:	74 13                	je     b8 <strcmp+0x38>
  a5:	0f b6 1a             	movzbl (%edx),%ebx
  a8:	38 d8                	cmp    %bl,%al
  aa:	74 ec                	je     98 <strcmp+0x18>
  ac:	0f b6 db             	movzbl %bl,%ebx
  af:	0f b6 c0             	movzbl %al,%eax
  b2:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  b4:	5b                   	pop    %ebx
  b5:	5d                   	pop    %ebp
  b6:	c3                   	ret    
  b7:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  b8:	0f b6 1a             	movzbl (%edx),%ebx
  bb:	31 c0                	xor    %eax,%eax
  bd:	0f b6 db             	movzbl %bl,%ebx
  c0:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  c2:	5b                   	pop    %ebx
  c3:	5d                   	pop    %ebp
  c4:	c3                   	ret    
  c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000d0 <strlen>:

uint
strlen(char *s)
{
  d0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
  d1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  d3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
  d5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  d7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  da:	80 39 00             	cmpb   $0x0,(%ecx)
  dd:	74 0c                	je     eb <strlen+0x1b>
  df:	90                   	nop
  e0:	83 c2 01             	add    $0x1,%edx
  e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  e7:	89 d0                	mov    %edx,%eax
  e9:	75 f5                	jne    e0 <strlen+0x10>
    ;
  return n;
}
  eb:	5d                   	pop    %ebp
  ec:	c3                   	ret    
  ed:	8d 76 00             	lea    0x0(%esi),%esi

000000f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 55 08             	mov    0x8(%ebp),%edx
  f6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	89 d7                	mov    %edx,%edi
  ff:	fc                   	cld    
 100:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 102:	89 d0                	mov    %edx,%eax
 104:	5f                   	pop    %edi
 105:	5d                   	pop    %ebp
 106:	c3                   	ret    
 107:	89 f6                	mov    %esi,%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000110 <strchr>:

char*
strchr(const char *s, char c)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 11a:	0f b6 10             	movzbl (%eax),%edx
 11d:	84 d2                	test   %dl,%dl
 11f:	75 11                	jne    132 <strchr+0x22>
 121:	eb 15                	jmp    138 <strchr+0x28>
 123:	90                   	nop
 124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 128:	83 c0 01             	add    $0x1,%eax
 12b:	0f b6 10             	movzbl (%eax),%edx
 12e:	84 d2                	test   %dl,%dl
 130:	74 06                	je     138 <strchr+0x28>
    if(*s == c)
 132:	38 ca                	cmp    %cl,%dl
 134:	75 f2                	jne    128 <strchr+0x18>
      return (char*)s;
  return 0;
}
 136:	5d                   	pop    %ebp
 137:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 138:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*)s;
  return 0;
}
 13a:	5d                   	pop    %ebp
 13b:	90                   	nop
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 140:	c3                   	ret    
 141:	eb 0d                	jmp    150 <atoi>
 143:	90                   	nop
 144:	90                   	nop
 145:	90                   	nop
 146:	90                   	nop
 147:	90                   	nop
 148:	90                   	nop
 149:	90                   	nop
 14a:	90                   	nop
 14b:	90                   	nop
 14c:	90                   	nop
 14d:	90                   	nop
 14e:	90                   	nop
 14f:	90                   	nop

00000150 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 150:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 151:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 153:	89 e5                	mov    %esp,%ebp
 155:	8b 4d 08             	mov    0x8(%ebp),%ecx
 158:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 159:	0f b6 11             	movzbl (%ecx),%edx
 15c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 15f:	80 fb 09             	cmp    $0x9,%bl
 162:	77 1c                	ja     180 <atoi+0x30>
 164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 168:	0f be d2             	movsbl %dl,%edx
 16b:	83 c1 01             	add    $0x1,%ecx
 16e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 171:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 175:	0f b6 11             	movzbl (%ecx),%edx
 178:	8d 5a d0             	lea    -0x30(%edx),%ebx
 17b:	80 fb 09             	cmp    $0x9,%bl
 17e:	76 e8                	jbe    168 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 180:	5b                   	pop    %ebx
 181:	5d                   	pop    %ebp
 182:	c3                   	ret    
 183:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	56                   	push   %esi
 194:	8b 45 08             	mov    0x8(%ebp),%eax
 197:	53                   	push   %ebx
 198:	8b 5d 10             	mov    0x10(%ebp),%ebx
 19b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 19e:	85 db                	test   %ebx,%ebx
 1a0:	7e 14                	jle    1b6 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 1a2:	31 d2                	xor    %edx,%edx
 1a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 1a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 1ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1af:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 1b2:	39 da                	cmp    %ebx,%edx
 1b4:	75 f2                	jne    1a8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 1b6:	5b                   	pop    %ebx
 1b7:	5e                   	pop    %esi
 1b8:	5d                   	pop    %ebp
 1b9:	c3                   	ret    
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001c0 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 1c9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 1cc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 1cf:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1db:	00 
 1dc:	89 04 24             	mov    %eax,(%esp)
 1df:	e8 d4 00 00 00       	call   2b8 <open>
  if(fd < 0)
 1e4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 1e8:	78 19                	js     203 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 1ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ed:	89 1c 24             	mov    %ebx,(%esp)
 1f0:	89 44 24 04          	mov    %eax,0x4(%esp)
 1f4:	e8 d7 00 00 00       	call   2d0 <fstat>
  close(fd);
 1f9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 1fc:	89 c6                	mov    %eax,%esi
  close(fd);
 1fe:	e8 9d 00 00 00       	call   2a0 <close>
  return r;
}
 203:	89 f0                	mov    %esi,%eax
 205:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 208:	8b 75 fc             	mov    -0x4(%ebp),%esi
 20b:	89 ec                	mov    %ebp,%esp
 20d:	5d                   	pop    %ebp
 20e:	c3                   	ret    
 20f:	90                   	nop

00000210 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
 215:	31 f6                	xor    %esi,%esi
 217:	53                   	push   %ebx
 218:	83 ec 2c             	sub    $0x2c,%esp
 21b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 21e:	eb 06                	jmp    226 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 220:	3c 0a                	cmp    $0xa,%al
 222:	74 39                	je     25d <gets+0x4d>
 224:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 226:	8d 5e 01             	lea    0x1(%esi),%ebx
 229:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 22c:	7d 31                	jge    25f <gets+0x4f>
    cc = read(0, &c, 1);
 22e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 231:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 238:	00 
 239:	89 44 24 04          	mov    %eax,0x4(%esp)
 23d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 244:	e8 47 00 00 00       	call   290 <read>
    if(cc < 1)
 249:	85 c0                	test   %eax,%eax
 24b:	7e 12                	jle    25f <gets+0x4f>
      break;
    buf[i++] = c;
 24d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 251:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 255:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 259:	3c 0d                	cmp    $0xd,%al
 25b:	75 c3                	jne    220 <gets+0x10>
 25d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 25f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 263:	89 f8                	mov    %edi,%eax
 265:	83 c4 2c             	add    $0x2c,%esp
 268:	5b                   	pop    %ebx
 269:	5e                   	pop    %esi
 26a:	5f                   	pop    %edi
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    
 26d:	90                   	nop
 26e:	90                   	nop
 26f:	90                   	nop

00000270 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 270:	b8 01 00 00 00       	mov    $0x1,%eax
 275:	cd 40                	int    $0x40
 277:	c3                   	ret    

00000278 <exit>:
SYSCALL(exit)
 278:	b8 02 00 00 00       	mov    $0x2,%eax
 27d:	cd 40                	int    $0x40
 27f:	c3                   	ret    

00000280 <wait>:
SYSCALL(wait)
 280:	b8 03 00 00 00       	mov    $0x3,%eax
 285:	cd 40                	int    $0x40
 287:	c3                   	ret    

00000288 <pipe>:
SYSCALL(pipe)
 288:	b8 04 00 00 00       	mov    $0x4,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <read>:
SYSCALL(read)
 290:	b8 05 00 00 00       	mov    $0x5,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <write>:
SYSCALL(write)
 298:	b8 10 00 00 00       	mov    $0x10,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <close>:
SYSCALL(close)
 2a0:	b8 15 00 00 00       	mov    $0x15,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <kill>:
SYSCALL(kill)
 2a8:	b8 06 00 00 00       	mov    $0x6,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <exec>:
SYSCALL(exec)
 2b0:	b8 07 00 00 00       	mov    $0x7,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <open>:
SYSCALL(open)
 2b8:	b8 0f 00 00 00       	mov    $0xf,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <mknod>:
SYSCALL(mknod)
 2c0:	b8 11 00 00 00       	mov    $0x11,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <unlink>:
SYSCALL(unlink)
 2c8:	b8 12 00 00 00       	mov    $0x12,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <fstat>:
SYSCALL(fstat)
 2d0:	b8 08 00 00 00       	mov    $0x8,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <link>:
SYSCALL(link)
 2d8:	b8 13 00 00 00       	mov    $0x13,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <mkdir>:
SYSCALL(mkdir)
 2e0:	b8 14 00 00 00       	mov    $0x14,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <chdir>:
SYSCALL(chdir)
 2e8:	b8 09 00 00 00       	mov    $0x9,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <dup>:
SYSCALL(dup)
 2f0:	b8 0a 00 00 00       	mov    $0xa,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <getpid>:
SYSCALL(getpid)
 2f8:	b8 0b 00 00 00       	mov    $0xb,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <sbrk>:
SYSCALL(sbrk)
 300:	b8 0c 00 00 00       	mov    $0xc,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <sleep>:
SYSCALL(sleep)
 308:	b8 0d 00 00 00       	mov    $0xd,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <uptime>:
SYSCALL(uptime)
 310:	b8 0e 00 00 00       	mov    $0xe,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    
 318:	90                   	nop
 319:	90                   	nop
 31a:	90                   	nop
 31b:	90                   	nop
 31c:	90                   	nop
 31d:	90                   	nop
 31e:	90                   	nop
 31f:	90                   	nop

00000320 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	89 cf                	mov    %ecx,%edi
 326:	56                   	push   %esi
 327:	89 c6                	mov    %eax,%esi
 329:	53                   	push   %ebx
 32a:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 32d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 330:	85 c9                	test   %ecx,%ecx
 332:	74 04                	je     338 <printint+0x18>
 334:	85 d2                	test   %edx,%edx
 336:	78 70                	js     3a8 <printint+0x88>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 338:	89 d0                	mov    %edx,%eax
 33a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 341:	31 c9                	xor    %ecx,%ecx
 343:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 346:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 348:	31 d2                	xor    %edx,%edx
 34a:	f7 f7                	div    %edi
 34c:	0f b6 92 63 07 00 00 	movzbl 0x763(%edx),%edx
 353:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 356:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
 359:	85 c0                	test   %eax,%eax
 35b:	75 eb                	jne    348 <printint+0x28>
  if(neg)
 35d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 360:	85 c0                	test   %eax,%eax
 362:	74 08                	je     36c <printint+0x4c>
    buf[i++] = '-';
 364:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 369:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
 36c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 36f:	01 fb                	add    %edi,%ebx
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 378:	0f b6 03             	movzbl (%ebx),%eax
 37b:	83 ef 01             	sub    $0x1,%edi
 37e:	83 eb 01             	sub    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 381:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 388:	00 
 389:	89 34 24             	mov    %esi,(%esp)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 38c:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 38f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 392:	89 44 24 04          	mov    %eax,0x4(%esp)
 396:	e8 fd fe ff ff       	call   298 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 39b:	83 ff ff             	cmp    $0xffffffff,%edi
 39e:	75 d8                	jne    378 <printint+0x58>
    putc(fd, buf[i]);
}
 3a0:	83 c4 4c             	add    $0x4c,%esp
 3a3:	5b                   	pop    %ebx
 3a4:	5e                   	pop    %esi
 3a5:	5f                   	pop    %edi
 3a6:	5d                   	pop    %ebp
 3a7:	c3                   	ret    
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3a8:	89 d0                	mov    %edx,%eax
 3aa:	f7 d8                	neg    %eax
 3ac:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 3b3:	eb 8c                	jmp    341 <printint+0x21>
 3b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003c0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
 3c6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cc:	0f b6 10             	movzbl (%eax),%edx
 3cf:	84 d2                	test   %dl,%dl
 3d1:	0f 84 c9 00 00 00    	je     4a0 <printf+0xe0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3d7:	8d 4d 10             	lea    0x10(%ebp),%ecx
 3da:	31 ff                	xor    %edi,%edi
 3dc:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 3df:	31 db                	xor    %ebx,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 3e1:	8d 75 e7             	lea    -0x19(%ebp),%esi
 3e4:	eb 1e                	jmp    404 <printf+0x44>
 3e6:	66 90                	xchg   %ax,%ax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 3e8:	83 fa 25             	cmp    $0x25,%edx
 3eb:	0f 85 b7 00 00 00    	jne    4a8 <printf+0xe8>
 3f1:	66 bf 25 00          	mov    $0x25,%di
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3f5:	83 c3 01             	add    $0x1,%ebx
 3f8:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 3fc:	84 d2                	test   %dl,%dl
 3fe:	0f 84 9c 00 00 00    	je     4a0 <printf+0xe0>
    c = fmt[i] & 0xff;
    if(state == 0){
 404:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 406:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 409:	74 dd                	je     3e8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 40b:	83 ff 25             	cmp    $0x25,%edi
 40e:	75 e5                	jne    3f5 <printf+0x35>
      if(c == 'd'){
 410:	83 fa 64             	cmp    $0x64,%edx
 413:	0f 84 57 01 00 00    	je     570 <printf+0x1b0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 419:	83 fa 70             	cmp    $0x70,%edx
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 420:	0f 84 aa 00 00 00    	je     4d0 <printf+0x110>
 426:	83 fa 78             	cmp    $0x78,%edx
 429:	0f 84 a1 00 00 00    	je     4d0 <printf+0x110>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 42f:	83 fa 73             	cmp    $0x73,%edx
 432:	0f 84 c0 00 00 00    	je     4f8 <printf+0x138>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 438:	83 fa 63             	cmp    $0x63,%edx
 43b:	90                   	nop
 43c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 440:	0f 84 52 01 00 00    	je     598 <printf+0x1d8>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 446:	83 fa 25             	cmp    $0x25,%edx
 449:	0f 84 f9 00 00 00    	je     548 <printf+0x188>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 44f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 452:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 455:	31 ff                	xor    %edi,%edi
 457:	89 55 cc             	mov    %edx,-0x34(%ebp)
 45a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 45e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 465:	00 
 466:	89 0c 24             	mov    %ecx,(%esp)
 469:	89 74 24 04          	mov    %esi,0x4(%esp)
 46d:	e8 26 fe ff ff       	call   298 <write>
 472:	8b 55 cc             	mov    -0x34(%ebp),%edx
 475:	8b 45 08             	mov    0x8(%ebp),%eax
 478:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 47f:	00 
 480:	89 74 24 04          	mov    %esi,0x4(%esp)
 484:	88 55 e7             	mov    %dl,-0x19(%ebp)
 487:	89 04 24             	mov    %eax,(%esp)
 48a:	e8 09 fe ff ff       	call   298 <write>
 48f:	8b 45 0c             	mov    0xc(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 492:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 496:	84 d2                	test   %dl,%dl
 498:	0f 85 66 ff ff ff    	jne    404 <printf+0x44>
 49e:	66 90                	xchg   %ax,%ax
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4a0:	83 c4 3c             	add    $0x3c,%esp
 4a3:	5b                   	pop    %ebx
 4a4:	5e                   	pop    %esi
 4a5:	5f                   	pop    %edi
 4a6:	5d                   	pop    %ebp
 4a7:	c3                   	ret    
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4a8:	8b 45 08             	mov    0x8(%ebp),%eax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4ab:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4ae:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4b5:	00 
 4b6:	89 74 24 04          	mov    %esi,0x4(%esp)
 4ba:	89 04 24             	mov    %eax,(%esp)
 4bd:	e8 d6 fd ff ff       	call   298 <write>
 4c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 4c5:	e9 2b ff ff ff       	jmp    3f5 <printf+0x35>
 4ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4d3:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 4d8:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4da:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4e1:	8b 10                	mov    (%eax),%edx
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
 4e6:	e8 35 fe ff ff       	call   320 <printint>
 4eb:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 4ee:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 4f2:	e9 fe fe ff ff       	jmp    3f5 <printf+0x35>
 4f7:	90                   	nop
      } else if(c == 's'){
        s = (char*)*ap;
 4f8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 4fb:	8b 3a                	mov    (%edx),%edi
        ap++;
 4fd:	83 c2 04             	add    $0x4,%edx
 500:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 503:	85 ff                	test   %edi,%edi
 505:	0f 84 ba 00 00 00    	je     5c5 <printf+0x205>
          s = "(null)";
        while(*s != 0){
 50b:	0f b6 17             	movzbl (%edi),%edx
 50e:	84 d2                	test   %dl,%dl
 510:	74 2d                	je     53f <printf+0x17f>
 512:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 515:	8b 5d 08             	mov    0x8(%ebp),%ebx
          putc(fd, *s);
          s++;
 518:	83 c7 01             	add    $0x1,%edi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 51b:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 51e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 525:	00 
 526:	89 74 24 04          	mov    %esi,0x4(%esp)
 52a:	89 1c 24             	mov    %ebx,(%esp)
 52d:	e8 66 fd ff ff       	call   298 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 532:	0f b6 17             	movzbl (%edi),%edx
 535:	84 d2                	test   %dl,%dl
 537:	75 df                	jne    518 <printf+0x158>
 539:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 53c:	8b 45 0c             	mov    0xc(%ebp),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 53f:	31 ff                	xor    %edi,%edi
 541:	e9 af fe ff ff       	jmp    3f5 <printf+0x35>
 546:	66 90                	xchg   %ax,%ax
 548:	8b 55 08             	mov    0x8(%ebp),%edx
 54b:	31 ff                	xor    %edi,%edi
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 54d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 551:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 558:	00 
 559:	89 74 24 04          	mov    %esi,0x4(%esp)
 55d:	89 14 24             	mov    %edx,(%esp)
 560:	e8 33 fd ff ff       	call   298 <write>
 565:	8b 45 0c             	mov    0xc(%ebp),%eax
 568:	e9 88 fe ff ff       	jmp    3f5 <printf+0x35>
 56d:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 570:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 573:	b9 0a 00 00 00       	mov    $0xa,%ecx
        ap++;
 578:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 57b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 582:	8b 10                	mov    (%eax),%edx
 584:	8b 45 08             	mov    0x8(%ebp),%eax
 587:	e8 94 fd ff ff       	call   320 <printint>
 58c:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 58f:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 593:	e9 5d fe ff ff       	jmp    3f5 <printf+0x35>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 598:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
        putc(fd, *ap);
        ap++;
 59b:	31 ff                	xor    %edi,%edi
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 59d:	8b 01                	mov    (%ecx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 59f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5a6:	00 
 5a7:	89 74 24 04          	mov    %esi,0x4(%esp)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5ab:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ae:	8b 45 08             	mov    0x8(%ebp),%eax
 5b1:	89 04 24             	mov    %eax,(%esp)
 5b4:	e8 df fc ff ff       	call   298 <write>
 5b9:	8b 45 0c             	mov    0xc(%ebp),%eax
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 5bc:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5c0:	e9 30 fe ff ff       	jmp    3f5 <printf+0x35>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
 5c5:	bf 5c 07 00 00       	mov    $0x75c,%edi
 5ca:	e9 3c ff ff ff       	jmp    50b <printf+0x14b>
 5cf:	90                   	nop

000005d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d1:	a1 7c 07 00 00       	mov    0x77c,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d6:	89 e5                	mov    %esp,%ebp
 5d8:	57                   	push   %edi
 5d9:	56                   	push   %esi
 5da:	53                   	push   %ebx
 5db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e1:	39 c8                	cmp    %ecx,%eax
 5e3:	73 1d                	jae    602 <free+0x32>
 5e5:	8d 76 00             	lea    0x0(%esi),%esi
 5e8:	8b 10                	mov    (%eax),%edx
 5ea:	39 d1                	cmp    %edx,%ecx
 5ec:	72 1a                	jb     608 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ee:	39 d0                	cmp    %edx,%eax
 5f0:	72 08                	jb     5fa <free+0x2a>
 5f2:	39 c8                	cmp    %ecx,%eax
 5f4:	72 12                	jb     608 <free+0x38>
 5f6:	39 d1                	cmp    %edx,%ecx
 5f8:	72 0e                	jb     608 <free+0x38>
 5fa:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5fc:	39 c8                	cmp    %ecx,%eax
 5fe:	66 90                	xchg   %ax,%ax
 600:	72 e6                	jb     5e8 <free+0x18>
 602:	8b 10                	mov    (%eax),%edx
 604:	eb e8                	jmp    5ee <free+0x1e>
 606:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 608:	8b 71 04             	mov    0x4(%ecx),%esi
 60b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 60e:	39 d7                	cmp    %edx,%edi
 610:	74 19                	je     62b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 612:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 615:	8b 50 04             	mov    0x4(%eax),%edx
 618:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 61b:	39 ce                	cmp    %ecx,%esi
 61d:	74 23                	je     642 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 61f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 621:	a3 7c 07 00 00       	mov    %eax,0x77c
}
 626:	5b                   	pop    %ebx
 627:	5e                   	pop    %esi
 628:	5f                   	pop    %edi
 629:	5d                   	pop    %ebp
 62a:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 62b:	03 72 04             	add    0x4(%edx),%esi
 62e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 631:	8b 10                	mov    (%eax),%edx
 633:	8b 12                	mov    (%edx),%edx
 635:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 638:	8b 50 04             	mov    0x4(%eax),%edx
 63b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 63e:	39 ce                	cmp    %ecx,%esi
 640:	75 dd                	jne    61f <free+0x4f>
    p->s.size += bp->s.size;
 642:	03 51 04             	add    0x4(%ecx),%edx
 645:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 648:	8b 53 f8             	mov    -0x8(%ebx),%edx
 64b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 64d:	a3 7c 07 00 00       	mov    %eax,0x77c
}
 652:	5b                   	pop    %ebx
 653:	5e                   	pop    %esi
 654:	5f                   	pop    %edi
 655:	5d                   	pop    %ebp
 656:	c3                   	ret    
 657:	89 f6                	mov    %esi,%esi
 659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000660 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 669:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 66c:	8b 0d 7c 07 00 00    	mov    0x77c,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 672:	83 c3 07             	add    $0x7,%ebx
 675:	c1 eb 03             	shr    $0x3,%ebx
 678:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 67b:	85 c9                	test   %ecx,%ecx
 67d:	0f 84 93 00 00 00    	je     716 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 683:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 685:	8b 50 04             	mov    0x4(%eax),%edx
 688:	39 d3                	cmp    %edx,%ebx
 68a:	76 1f                	jbe    6ab <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 68c:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 693:	90                   	nop
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 698:	3b 05 7c 07 00 00    	cmp    0x77c,%eax
 69e:	74 30                	je     6d0 <malloc+0x70>
 6a0:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6a2:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 6a4:	8b 50 04             	mov    0x4(%eax),%edx
 6a7:	39 d3                	cmp    %edx,%ebx
 6a9:	77 ed                	ja     698 <malloc+0x38>
      if(p->s.size == nunits)
 6ab:	39 d3                	cmp    %edx,%ebx
 6ad:	74 61                	je     710 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6af:	29 da                	sub    %ebx,%edx
 6b1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6b4:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6b7:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6ba:	89 0d 7c 07 00 00    	mov    %ecx,0x77c
      return (void*)(p + 1);
 6c0:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6c3:	83 c4 1c             	add    $0x1c,%esp
 6c6:	5b                   	pop    %ebx
 6c7:	5e                   	pop    %esi
 6c8:	5f                   	pop    %edi
 6c9:	5d                   	pop    %ebp
 6ca:	c3                   	ret    
 6cb:	90                   	nop
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 6d0:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 6d6:	b8 00 80 00 00       	mov    $0x8000,%eax
 6db:	bf 00 10 00 00       	mov    $0x1000,%edi
 6e0:	76 04                	jbe    6e6 <malloc+0x86>
 6e2:	89 f0                	mov    %esi,%eax
 6e4:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 6e6:	89 04 24             	mov    %eax,(%esp)
 6e9:	e8 12 fc ff ff       	call   300 <sbrk>
  if(p == (char*)-1)
 6ee:	83 f8 ff             	cmp    $0xffffffff,%eax
 6f1:	74 18                	je     70b <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6f3:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 6f6:	83 c0 08             	add    $0x8,%eax
 6f9:	89 04 24             	mov    %eax,(%esp)
 6fc:	e8 cf fe ff ff       	call   5d0 <free>
  return freep;
 701:	8b 0d 7c 07 00 00    	mov    0x77c,%ecx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 707:	85 c9                	test   %ecx,%ecx
 709:	75 97                	jne    6a2 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 70b:	31 c0                	xor    %eax,%eax
 70d:	eb b4                	jmp    6c3 <malloc+0x63>
 70f:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 710:	8b 10                	mov    (%eax),%edx
 712:	89 11                	mov    %edx,(%ecx)
 714:	eb a4                	jmp    6ba <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 716:	c7 05 7c 07 00 00 74 	movl   $0x774,0x77c
 71d:	07 00 00 
    base.s.size = 0;
 720:	b9 74 07 00 00       	mov    $0x774,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 725:	c7 05 74 07 00 00 74 	movl   $0x774,0x774
 72c:	07 00 00 
    base.s.size = 0;
 72f:	c7 05 78 07 00 00 00 	movl   $0x0,0x778
 736:	00 00 00 
 739:	e9 45 ff ff ff       	jmp    683 <malloc+0x23>

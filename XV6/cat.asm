
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	83 ec 10             	sub    $0x10,%esp
   8:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   b:	eb 1f                	jmp    2c <cat+0x2c>
   d:	8d 76 00             	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  10:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  14:	c7 44 24 04 a0 08 00 	movl   $0x8a0,0x4(%esp)
  1b:	00 
  1c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  23:	e8 50 03 00 00       	call   378 <write>
  28:	39 c3                	cmp    %eax,%ebx
  2a:	75 28                	jne    54 <cat+0x54>
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
  2c:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  33:	00 
  34:	c7 44 24 04 a0 08 00 	movl   $0x8a0,0x4(%esp)
  3b:	00 
  3c:	89 34 24             	mov    %esi,(%esp)
  3f:	e8 2c 03 00 00       	call   370 <read>
  44:	83 f8 00             	cmp    $0x0,%eax
  47:	89 c3                	mov    %eax,%ebx
  49:	7f c5                	jg     10 <cat+0x10>
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
      exit();
    }
  }
  if(n < 0){
  4b:	75 20                	jne    6d <cat+0x6d>
    printf(1, "cat: read error\n");
    exit();
  }
}
  4d:	83 c4 10             	add    $0x10,%esp
  50:	5b                   	pop    %ebx
  51:	5e                   	pop    %esi
  52:	5d                   	pop    %ebp
  53:	c3                   	ret    
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
  54:	c7 44 24 04 1e 08 00 	movl   $0x81e,0x4(%esp)
  5b:	00 
  5c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  63:	e8 38 04 00 00       	call   4a0 <printf>
      exit();
  68:	e8 eb 02 00 00       	call   358 <exit>
    }
  }
  if(n < 0){
    printf(1, "cat: read error\n");
  6d:	c7 44 24 04 30 08 00 	movl   $0x830,0x4(%esp)
  74:	00 
  75:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7c:	e8 1f 04 00 00       	call   4a0 <printf>
    exit();
  81:	e8 d2 02 00 00       	call   358 <exit>
  86:	8d 76 00             	lea    0x0(%esi),%esi
  89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000090 <main>:
  }
}

int
main(int argc, char *argv[])
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	83 e4 f0             	and    $0xfffffff0,%esp
  96:	57                   	push   %edi
  97:	56                   	push   %esi
  98:	53                   	push   %ebx
  99:	83 ec 24             	sub    $0x24,%esp
  9c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int fd, i;

  if(argc <= 1){
  9f:	83 ff 01             	cmp    $0x1,%edi
  a2:	7e 6c                	jle    110 <main+0x80>
    cat(0);
    exit();
  a4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  a7:	be 01 00 00 00       	mov    $0x1,%esi
  ac:	83 c3 04             	add    $0x4,%ebx
  af:	90                   	nop
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  b0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  b7:	00 
  b8:	8b 03                	mov    (%ebx),%eax
  ba:	89 04 24             	mov    %eax,(%esp)
  bd:	e8 d6 02 00 00       	call   398 <open>
  c2:	85 c0                	test   %eax,%eax
  c4:	78 2a                	js     f0 <main+0x60>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  c6:	89 04 24             	mov    %eax,(%esp)
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  c9:	83 c6 01             	add    $0x1,%esi
  cc:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  cf:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  d3:	e8 28 ff ff ff       	call   0 <cat>
    close(fd);
  d8:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  dc:	89 04 24             	mov    %eax,(%esp)
  df:	e8 9c 02 00 00       	call   380 <close>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  e4:	39 f7                	cmp    %esi,%edi
  e6:	7f c8                	jg     b0 <main+0x20>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
  e8:	e8 6b 02 00 00       	call   358 <exit>
  ed:	8d 76 00             	lea    0x0(%esi),%esi
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
  f0:	8b 03                	mov    (%ebx),%eax
  f2:	c7 44 24 04 41 08 00 	movl   $0x841,0x4(%esp)
  f9:	00 
  fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 101:	89 44 24 08          	mov    %eax,0x8(%esp)
 105:	e8 96 03 00 00       	call   4a0 <printf>
      exit();
 10a:	e8 49 02 00 00       	call   358 <exit>
 10f:	90                   	nop
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    cat(0);
 110:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 117:	e8 e4 fe ff ff       	call   0 <cat>
    exit();
 11c:	e8 37 02 00 00       	call   358 <exit>
 121:	90                   	nop
 122:	90                   	nop
 123:	90                   	nop
 124:	90                   	nop
 125:	90                   	nop
 126:	90                   	nop
 127:	90                   	nop
 128:	90                   	nop
 129:	90                   	nop
 12a:	90                   	nop
 12b:	90                   	nop
 12c:	90                   	nop
 12d:	90                   	nop
 12e:	90                   	nop
 12f:	90                   	nop

00000130 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 130:	55                   	push   %ebp
 131:	31 d2                	xor    %edx,%edx
 133:	89 e5                	mov    %esp,%ebp
 135:	8b 45 08             	mov    0x8(%ebp),%eax
 138:	53                   	push   %ebx
 139:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 140:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 144:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 147:	83 c2 01             	add    $0x1,%edx
 14a:	84 c9                	test   %cl,%cl
 14c:	75 f2                	jne    140 <strcpy+0x10>
    ;
  return os;
}
 14e:	5b                   	pop    %ebx
 14f:	5d                   	pop    %ebp
 150:	c3                   	ret    
 151:	eb 0d                	jmp    160 <strcmp>
 153:	90                   	nop
 154:	90                   	nop
 155:	90                   	nop
 156:	90                   	nop
 157:	90                   	nop
 158:	90                   	nop
 159:	90                   	nop
 15a:	90                   	nop
 15b:	90                   	nop
 15c:	90                   	nop
 15d:	90                   	nop
 15e:	90                   	nop
 15f:	90                   	nop

00000160 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	53                   	push   %ebx
 164:	8b 4d 08             	mov    0x8(%ebp),%ecx
 167:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 16a:	0f b6 01             	movzbl (%ecx),%eax
 16d:	84 c0                	test   %al,%al
 16f:	75 14                	jne    185 <strcmp+0x25>
 171:	eb 25                	jmp    198 <strcmp+0x38>
 173:	90                   	nop
 174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 178:	83 c1 01             	add    $0x1,%ecx
 17b:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 17e:	0f b6 01             	movzbl (%ecx),%eax
 181:	84 c0                	test   %al,%al
 183:	74 13                	je     198 <strcmp+0x38>
 185:	0f b6 1a             	movzbl (%edx),%ebx
 188:	38 d8                	cmp    %bl,%al
 18a:	74 ec                	je     178 <strcmp+0x18>
 18c:	0f b6 db             	movzbl %bl,%ebx
 18f:	0f b6 c0             	movzbl %al,%eax
 192:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 194:	5b                   	pop    %ebx
 195:	5d                   	pop    %ebp
 196:	c3                   	ret    
 197:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 198:	0f b6 1a             	movzbl (%edx),%ebx
 19b:	31 c0                	xor    %eax,%eax
 19d:	0f b6 db             	movzbl %bl,%ebx
 1a0:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1a2:	5b                   	pop    %ebx
 1a3:	5d                   	pop    %ebp
 1a4:	c3                   	ret    
 1a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001b0 <strlen>:

uint
strlen(char *s)
{
 1b0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 1b1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 1b3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 1b5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 1b7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1ba:	80 39 00             	cmpb   $0x0,(%ecx)
 1bd:	74 0c                	je     1cb <strlen+0x1b>
 1bf:	90                   	nop
 1c0:	83 c2 01             	add    $0x1,%edx
 1c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1c7:	89 d0                	mov    %edx,%eax
 1c9:	75 f5                	jne    1c0 <strlen+0x10>
    ;
  return n;
}
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
 1cd:	8d 76 00             	lea    0x0(%esi),%esi

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 55 08             	mov    0x8(%ebp),%edx
 1d6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	89 d7                	mov    %edx,%edi
 1df:	fc                   	cld    
 1e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e2:	89 d0                	mov    %edx,%eax
 1e4:	5f                   	pop    %edi
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    
 1e7:	89 f6                	mov    %esi,%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fa:	0f b6 10             	movzbl (%eax),%edx
 1fd:	84 d2                	test   %dl,%dl
 1ff:	75 11                	jne    212 <strchr+0x22>
 201:	eb 15                	jmp    218 <strchr+0x28>
 203:	90                   	nop
 204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 208:	83 c0 01             	add    $0x1,%eax
 20b:	0f b6 10             	movzbl (%eax),%edx
 20e:	84 d2                	test   %dl,%dl
 210:	74 06                	je     218 <strchr+0x28>
    if(*s == c)
 212:	38 ca                	cmp    %cl,%dl
 214:	75 f2                	jne    208 <strchr+0x18>
      return (char*)s;
  return 0;
}
 216:	5d                   	pop    %ebp
 217:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 218:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*)s;
  return 0;
}
 21a:	5d                   	pop    %ebp
 21b:	90                   	nop
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 220:	c3                   	ret    
 221:	eb 0d                	jmp    230 <atoi>
 223:	90                   	nop
 224:	90                   	nop
 225:	90                   	nop
 226:	90                   	nop
 227:	90                   	nop
 228:	90                   	nop
 229:	90                   	nop
 22a:	90                   	nop
 22b:	90                   	nop
 22c:	90                   	nop
 22d:	90                   	nop
 22e:	90                   	nop
 22f:	90                   	nop

00000230 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 230:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 231:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 233:	89 e5                	mov    %esp,%ebp
 235:	8b 4d 08             	mov    0x8(%ebp),%ecx
 238:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 239:	0f b6 11             	movzbl (%ecx),%edx
 23c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 23f:	80 fb 09             	cmp    $0x9,%bl
 242:	77 1c                	ja     260 <atoi+0x30>
 244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 248:	0f be d2             	movsbl %dl,%edx
 24b:	83 c1 01             	add    $0x1,%ecx
 24e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 251:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 255:	0f b6 11             	movzbl (%ecx),%edx
 258:	8d 5a d0             	lea    -0x30(%edx),%ebx
 25b:	80 fb 09             	cmp    $0x9,%bl
 25e:	76 e8                	jbe    248 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 260:	5b                   	pop    %ebx
 261:	5d                   	pop    %ebp
 262:	c3                   	ret    
 263:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	8b 45 08             	mov    0x8(%ebp),%eax
 277:	53                   	push   %ebx
 278:	8b 5d 10             	mov    0x10(%ebp),%ebx
 27b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 27e:	85 db                	test   %ebx,%ebx
 280:	7e 14                	jle    296 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 282:	31 d2                	xor    %edx,%edx
 284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 288:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 28c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 28f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 292:	39 da                	cmp    %ebx,%edx
 294:	75 f2                	jne    288 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 296:	5b                   	pop    %ebx
 297:	5e                   	pop    %esi
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    
 29a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002a0 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 2a9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 2ac:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 2af:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2bb:	00 
 2bc:	89 04 24             	mov    %eax,(%esp)
 2bf:	e8 d4 00 00 00       	call   398 <open>
  if(fd < 0)
 2c4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2c8:	78 19                	js     2e3 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 2ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cd:	89 1c 24             	mov    %ebx,(%esp)
 2d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d4:	e8 d7 00 00 00       	call   3b0 <fstat>
  close(fd);
 2d9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 2dc:	89 c6                	mov    %eax,%esi
  close(fd);
 2de:	e8 9d 00 00 00       	call   380 <close>
  return r;
}
 2e3:	89 f0                	mov    %esi,%eax
 2e5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 2e8:	8b 75 fc             	mov    -0x4(%ebp),%esi
 2eb:	89 ec                	mov    %ebp,%esp
 2ed:	5d                   	pop    %ebp
 2ee:	c3                   	ret    
 2ef:	90                   	nop

000002f0 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	57                   	push   %edi
 2f4:	56                   	push   %esi
 2f5:	31 f6                	xor    %esi,%esi
 2f7:	53                   	push   %ebx
 2f8:	83 ec 2c             	sub    $0x2c,%esp
 2fb:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2fe:	eb 06                	jmp    306 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 300:	3c 0a                	cmp    $0xa,%al
 302:	74 39                	je     33d <gets+0x4d>
 304:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 306:	8d 5e 01             	lea    0x1(%esi),%ebx
 309:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 30c:	7d 31                	jge    33f <gets+0x4f>
    cc = read(0, &c, 1);
 30e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 311:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 318:	00 
 319:	89 44 24 04          	mov    %eax,0x4(%esp)
 31d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 324:	e8 47 00 00 00       	call   370 <read>
    if(cc < 1)
 329:	85 c0                	test   %eax,%eax
 32b:	7e 12                	jle    33f <gets+0x4f>
      break;
    buf[i++] = c;
 32d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 331:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 335:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 339:	3c 0d                	cmp    $0xd,%al
 33b:	75 c3                	jne    300 <gets+0x10>
 33d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 33f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 343:	89 f8                	mov    %edi,%eax
 345:	83 c4 2c             	add    $0x2c,%esp
 348:	5b                   	pop    %ebx
 349:	5e                   	pop    %esi
 34a:	5f                   	pop    %edi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    
 34d:	90                   	nop
 34e:	90                   	nop
 34f:	90                   	nop

00000350 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 350:	b8 01 00 00 00       	mov    $0x1,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <exit>:
SYSCALL(exit)
 358:	b8 02 00 00 00       	mov    $0x2,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <wait>:
SYSCALL(wait)
 360:	b8 03 00 00 00       	mov    $0x3,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <pipe>:
SYSCALL(pipe)
 368:	b8 04 00 00 00       	mov    $0x4,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <read>:
SYSCALL(read)
 370:	b8 05 00 00 00       	mov    $0x5,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <write>:
SYSCALL(write)
 378:	b8 10 00 00 00       	mov    $0x10,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <close>:
SYSCALL(close)
 380:	b8 15 00 00 00       	mov    $0x15,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <kill>:
SYSCALL(kill)
 388:	b8 06 00 00 00       	mov    $0x6,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <exec>:
SYSCALL(exec)
 390:	b8 07 00 00 00       	mov    $0x7,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <open>:
SYSCALL(open)
 398:	b8 0f 00 00 00       	mov    $0xf,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <mknod>:
SYSCALL(mknod)
 3a0:	b8 11 00 00 00       	mov    $0x11,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <unlink>:
SYSCALL(unlink)
 3a8:	b8 12 00 00 00       	mov    $0x12,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <fstat>:
SYSCALL(fstat)
 3b0:	b8 08 00 00 00       	mov    $0x8,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <link>:
SYSCALL(link)
 3b8:	b8 13 00 00 00       	mov    $0x13,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <mkdir>:
SYSCALL(mkdir)
 3c0:	b8 14 00 00 00       	mov    $0x14,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <chdir>:
SYSCALL(chdir)
 3c8:	b8 09 00 00 00       	mov    $0x9,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <dup>:
SYSCALL(dup)
 3d0:	b8 0a 00 00 00       	mov    $0xa,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <getpid>:
SYSCALL(getpid)
 3d8:	b8 0b 00 00 00       	mov    $0xb,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <sbrk>:
SYSCALL(sbrk)
 3e0:	b8 0c 00 00 00       	mov    $0xc,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <sleep>:
SYSCALL(sleep)
 3e8:	b8 0d 00 00 00       	mov    $0xd,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <uptime>:
SYSCALL(uptime)
 3f0:	b8 0e 00 00 00       	mov    $0xe,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    
 3f8:	90                   	nop
 3f9:	90                   	nop
 3fa:	90                   	nop
 3fb:	90                   	nop
 3fc:	90                   	nop
 3fd:	90                   	nop
 3fe:	90                   	nop
 3ff:	90                   	nop

00000400 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	89 cf                	mov    %ecx,%edi
 406:	56                   	push   %esi
 407:	89 c6                	mov    %eax,%esi
 409:	53                   	push   %ebx
 40a:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 40d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 410:	85 c9                	test   %ecx,%ecx
 412:	74 04                	je     418 <printint+0x18>
 414:	85 d2                	test   %edx,%edx
 416:	78 70                	js     488 <printint+0x88>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 418:	89 d0                	mov    %edx,%eax
 41a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 421:	31 c9                	xor    %ecx,%ecx
 423:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 426:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 428:	31 d2                	xor    %edx,%edx
 42a:	f7 f7                	div    %edi
 42c:	0f b6 92 5d 08 00 00 	movzbl 0x85d(%edx),%edx
 433:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 436:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
 439:	85 c0                	test   %eax,%eax
 43b:	75 eb                	jne    428 <printint+0x28>
  if(neg)
 43d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 440:	85 c0                	test   %eax,%eax
 442:	74 08                	je     44c <printint+0x4c>
    buf[i++] = '-';
 444:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 449:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
 44c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 44f:	01 fb                	add    %edi,%ebx
 451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 458:	0f b6 03             	movzbl (%ebx),%eax
 45b:	83 ef 01             	sub    $0x1,%edi
 45e:	83 eb 01             	sub    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 461:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 468:	00 
 469:	89 34 24             	mov    %esi,(%esp)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 46c:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 46f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 472:	89 44 24 04          	mov    %eax,0x4(%esp)
 476:	e8 fd fe ff ff       	call   378 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 47b:	83 ff ff             	cmp    $0xffffffff,%edi
 47e:	75 d8                	jne    458 <printint+0x58>
    putc(fd, buf[i]);
}
 480:	83 c4 4c             	add    $0x4c,%esp
 483:	5b                   	pop    %ebx
 484:	5e                   	pop    %esi
 485:	5f                   	pop    %edi
 486:	5d                   	pop    %ebp
 487:	c3                   	ret    
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 488:	89 d0                	mov    %edx,%eax
 48a:	f7 d8                	neg    %eax
 48c:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 493:	eb 8c                	jmp    421 <printint+0x21>
 495:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004a0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ac:	0f b6 10             	movzbl (%eax),%edx
 4af:	84 d2                	test   %dl,%dl
 4b1:	0f 84 c9 00 00 00    	je     580 <printf+0xe0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4b7:	8d 4d 10             	lea    0x10(%ebp),%ecx
 4ba:	31 ff                	xor    %edi,%edi
 4bc:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 4bf:	31 db                	xor    %ebx,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4c1:	8d 75 e7             	lea    -0x19(%ebp),%esi
 4c4:	eb 1e                	jmp    4e4 <printf+0x44>
 4c6:	66 90                	xchg   %ax,%ax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4c8:	83 fa 25             	cmp    $0x25,%edx
 4cb:	0f 85 b7 00 00 00    	jne    588 <printf+0xe8>
 4d1:	66 bf 25 00          	mov    $0x25,%di
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4d5:	83 c3 01             	add    $0x1,%ebx
 4d8:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 4dc:	84 d2                	test   %dl,%dl
 4de:	0f 84 9c 00 00 00    	je     580 <printf+0xe0>
    c = fmt[i] & 0xff;
    if(state == 0){
 4e4:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 4e6:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 4e9:	74 dd                	je     4c8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4eb:	83 ff 25             	cmp    $0x25,%edi
 4ee:	75 e5                	jne    4d5 <printf+0x35>
      if(c == 'd'){
 4f0:	83 fa 64             	cmp    $0x64,%edx
 4f3:	0f 84 57 01 00 00    	je     650 <printf+0x1b0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4f9:	83 fa 70             	cmp    $0x70,%edx
 4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 500:	0f 84 aa 00 00 00    	je     5b0 <printf+0x110>
 506:	83 fa 78             	cmp    $0x78,%edx
 509:	0f 84 a1 00 00 00    	je     5b0 <printf+0x110>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 50f:	83 fa 73             	cmp    $0x73,%edx
 512:	0f 84 c0 00 00 00    	je     5d8 <printf+0x138>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 518:	83 fa 63             	cmp    $0x63,%edx
 51b:	90                   	nop
 51c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 520:	0f 84 52 01 00 00    	je     678 <printf+0x1d8>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 526:	83 fa 25             	cmp    $0x25,%edx
 529:	0f 84 f9 00 00 00    	je     628 <printf+0x188>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 52f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 532:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 535:	31 ff                	xor    %edi,%edi
 537:	89 55 cc             	mov    %edx,-0x34(%ebp)
 53a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 53e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 545:	00 
 546:	89 0c 24             	mov    %ecx,(%esp)
 549:	89 74 24 04          	mov    %esi,0x4(%esp)
 54d:	e8 26 fe ff ff       	call   378 <write>
 552:	8b 55 cc             	mov    -0x34(%ebp),%edx
 555:	8b 45 08             	mov    0x8(%ebp),%eax
 558:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 55f:	00 
 560:	89 74 24 04          	mov    %esi,0x4(%esp)
 564:	88 55 e7             	mov    %dl,-0x19(%ebp)
 567:	89 04 24             	mov    %eax,(%esp)
 56a:	e8 09 fe ff ff       	call   378 <write>
 56f:	8b 45 0c             	mov    0xc(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 572:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 576:	84 d2                	test   %dl,%dl
 578:	0f 85 66 ff ff ff    	jne    4e4 <printf+0x44>
 57e:	66 90                	xchg   %ax,%ax
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 580:	83 c4 3c             	add    $0x3c,%esp
 583:	5b                   	pop    %ebx
 584:	5e                   	pop    %esi
 585:	5f                   	pop    %edi
 586:	5d                   	pop    %ebp
 587:	c3                   	ret    
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 588:	8b 45 08             	mov    0x8(%ebp),%eax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 58b:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 58e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 595:	00 
 596:	89 74 24 04          	mov    %esi,0x4(%esp)
 59a:	89 04 24             	mov    %eax,(%esp)
 59d:	e8 d6 fd ff ff       	call   378 <write>
 5a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 5a5:	e9 2b ff ff ff       	jmp    4d5 <printf+0x35>
 5aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 5b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5b3:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 5b8:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 5ba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5c1:	8b 10                	mov    (%eax),%edx
 5c3:	8b 45 08             	mov    0x8(%ebp),%eax
 5c6:	e8 35 fe ff ff       	call   400 <printint>
 5cb:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 5ce:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5d2:	e9 fe fe ff ff       	jmp    4d5 <printf+0x35>
 5d7:	90                   	nop
      } else if(c == 's'){
        s = (char*)*ap;
 5d8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 5db:	8b 3a                	mov    (%edx),%edi
        ap++;
 5dd:	83 c2 04             	add    $0x4,%edx
 5e0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 5e3:	85 ff                	test   %edi,%edi
 5e5:	0f 84 ba 00 00 00    	je     6a5 <printf+0x205>
          s = "(null)";
        while(*s != 0){
 5eb:	0f b6 17             	movzbl (%edi),%edx
 5ee:	84 d2                	test   %dl,%dl
 5f0:	74 2d                	je     61f <printf+0x17f>
 5f2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
          putc(fd, *s);
          s++;
 5f8:	83 c7 01             	add    $0x1,%edi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5fb:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5fe:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 605:	00 
 606:	89 74 24 04          	mov    %esi,0x4(%esp)
 60a:	89 1c 24             	mov    %ebx,(%esp)
 60d:	e8 66 fd ff ff       	call   378 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 612:	0f b6 17             	movzbl (%edi),%edx
 615:	84 d2                	test   %dl,%dl
 617:	75 df                	jne    5f8 <printf+0x158>
 619:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 61c:	8b 45 0c             	mov    0xc(%ebp),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 61f:	31 ff                	xor    %edi,%edi
 621:	e9 af fe ff ff       	jmp    4d5 <printf+0x35>
 626:	66 90                	xchg   %ax,%ax
 628:	8b 55 08             	mov    0x8(%ebp),%edx
 62b:	31 ff                	xor    %edi,%edi
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 62d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 631:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 638:	00 
 639:	89 74 24 04          	mov    %esi,0x4(%esp)
 63d:	89 14 24             	mov    %edx,(%esp)
 640:	e8 33 fd ff ff       	call   378 <write>
 645:	8b 45 0c             	mov    0xc(%ebp),%eax
 648:	e9 88 fe ff ff       	jmp    4d5 <printf+0x35>
 64d:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 650:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 653:	b9 0a 00 00 00       	mov    $0xa,%ecx
        ap++;
 658:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 65b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 662:	8b 10                	mov    (%eax),%edx
 664:	8b 45 08             	mov    0x8(%ebp),%eax
 667:	e8 94 fd ff ff       	call   400 <printint>
 66c:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 66f:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 673:	e9 5d fe ff ff       	jmp    4d5 <printf+0x35>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 678:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
        putc(fd, *ap);
        ap++;
 67b:	31 ff                	xor    %edi,%edi
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 67d:	8b 01                	mov    (%ecx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 67f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 686:	00 
 687:	89 74 24 04          	mov    %esi,0x4(%esp)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 68b:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 68e:	8b 45 08             	mov    0x8(%ebp),%eax
 691:	89 04 24             	mov    %eax,(%esp)
 694:	e8 df fc ff ff       	call   378 <write>
 699:	8b 45 0c             	mov    0xc(%ebp),%eax
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 69c:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6a0:	e9 30 fe ff ff       	jmp    4d5 <printf+0x35>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
 6a5:	bf 56 08 00 00       	mov    $0x856,%edi
 6aa:	e9 3c ff ff ff       	jmp    5eb <printf+0x14b>
 6af:	90                   	nop

000006b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b1:	a1 88 08 00 00       	mov    0x888,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b6:	89 e5                	mov    %esp,%ebp
 6b8:	57                   	push   %edi
 6b9:	56                   	push   %esi
 6ba:	53                   	push   %ebx
 6bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c1:	39 c8                	cmp    %ecx,%eax
 6c3:	73 1d                	jae    6e2 <free+0x32>
 6c5:	8d 76 00             	lea    0x0(%esi),%esi
 6c8:	8b 10                	mov    (%eax),%edx
 6ca:	39 d1                	cmp    %edx,%ecx
 6cc:	72 1a                	jb     6e8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ce:	39 d0                	cmp    %edx,%eax
 6d0:	72 08                	jb     6da <free+0x2a>
 6d2:	39 c8                	cmp    %ecx,%eax
 6d4:	72 12                	jb     6e8 <free+0x38>
 6d6:	39 d1                	cmp    %edx,%ecx
 6d8:	72 0e                	jb     6e8 <free+0x38>
 6da:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6dc:	39 c8                	cmp    %ecx,%eax
 6de:	66 90                	xchg   %ax,%ax
 6e0:	72 e6                	jb     6c8 <free+0x18>
 6e2:	8b 10                	mov    (%eax),%edx
 6e4:	eb e8                	jmp    6ce <free+0x1e>
 6e6:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6e8:	8b 71 04             	mov    0x4(%ecx),%esi
 6eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ee:	39 d7                	cmp    %edx,%edi
 6f0:	74 19                	je     70b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6f5:	8b 50 04             	mov    0x4(%eax),%edx
 6f8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6fb:	39 ce                	cmp    %ecx,%esi
 6fd:	74 23                	je     722 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6ff:	89 08                	mov    %ecx,(%eax)
  freep = p;
 701:	a3 88 08 00 00       	mov    %eax,0x888
}
 706:	5b                   	pop    %ebx
 707:	5e                   	pop    %esi
 708:	5f                   	pop    %edi
 709:	5d                   	pop    %ebp
 70a:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 70b:	03 72 04             	add    0x4(%edx),%esi
 70e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 711:	8b 10                	mov    (%eax),%edx
 713:	8b 12                	mov    (%edx),%edx
 715:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 718:	8b 50 04             	mov    0x4(%eax),%edx
 71b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 71e:	39 ce                	cmp    %ecx,%esi
 720:	75 dd                	jne    6ff <free+0x4f>
    p->s.size += bp->s.size;
 722:	03 51 04             	add    0x4(%ecx),%edx
 725:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 728:	8b 53 f8             	mov    -0x8(%ebx),%edx
 72b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 72d:	a3 88 08 00 00       	mov    %eax,0x888
}
 732:	5b                   	pop    %ebx
 733:	5e                   	pop    %esi
 734:	5f                   	pop    %edi
 735:	5d                   	pop    %ebp
 736:	c3                   	ret    
 737:	89 f6                	mov    %esi,%esi
 739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000740 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	57                   	push   %edi
 744:	56                   	push   %esi
 745:	53                   	push   %ebx
 746:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 749:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 74c:	8b 0d 88 08 00 00    	mov    0x888,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 752:	83 c3 07             	add    $0x7,%ebx
 755:	c1 eb 03             	shr    $0x3,%ebx
 758:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 75b:	85 c9                	test   %ecx,%ecx
 75d:	0f 84 93 00 00 00    	je     7f6 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 763:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 765:	8b 50 04             	mov    0x4(%eax),%edx
 768:	39 d3                	cmp    %edx,%ebx
 76a:	76 1f                	jbe    78b <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 76c:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 773:	90                   	nop
 774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 778:	3b 05 88 08 00 00    	cmp    0x888,%eax
 77e:	74 30                	je     7b0 <malloc+0x70>
 780:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 782:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 784:	8b 50 04             	mov    0x4(%eax),%edx
 787:	39 d3                	cmp    %edx,%ebx
 789:	77 ed                	ja     778 <malloc+0x38>
      if(p->s.size == nunits)
 78b:	39 d3                	cmp    %edx,%ebx
 78d:	74 61                	je     7f0 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 78f:	29 da                	sub    %ebx,%edx
 791:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 794:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 797:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 79a:	89 0d 88 08 00 00    	mov    %ecx,0x888
      return (void*)(p + 1);
 7a0:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7a3:	83 c4 1c             	add    $0x1c,%esp
 7a6:	5b                   	pop    %ebx
 7a7:	5e                   	pop    %esi
 7a8:	5f                   	pop    %edi
 7a9:	5d                   	pop    %ebp
 7aa:	c3                   	ret    
 7ab:	90                   	nop
 7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 7b0:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 7b6:	b8 00 80 00 00       	mov    $0x8000,%eax
 7bb:	bf 00 10 00 00       	mov    $0x1000,%edi
 7c0:	76 04                	jbe    7c6 <malloc+0x86>
 7c2:	89 f0                	mov    %esi,%eax
 7c4:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 7c6:	89 04 24             	mov    %eax,(%esp)
 7c9:	e8 12 fc ff ff       	call   3e0 <sbrk>
  if(p == (char*)-1)
 7ce:	83 f8 ff             	cmp    $0xffffffff,%eax
 7d1:	74 18                	je     7eb <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7d3:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 7d6:	83 c0 08             	add    $0x8,%eax
 7d9:	89 04 24             	mov    %eax,(%esp)
 7dc:	e8 cf fe ff ff       	call   6b0 <free>
  return freep;
 7e1:	8b 0d 88 08 00 00    	mov    0x888,%ecx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 7e7:	85 c9                	test   %ecx,%ecx
 7e9:	75 97                	jne    782 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7eb:	31 c0                	xor    %eax,%eax
 7ed:	eb b4                	jmp    7a3 <malloc+0x63>
 7ef:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 7f0:	8b 10                	mov    (%eax),%edx
 7f2:	89 11                	mov    %edx,(%ecx)
 7f4:	eb a4                	jmp    79a <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7f6:	c7 05 88 08 00 00 80 	movl   $0x880,0x888
 7fd:	08 00 00 
    base.s.size = 0;
 800:	b9 80 08 00 00       	mov    $0x880,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 805:	c7 05 80 08 00 00 80 	movl   $0x880,0x880
 80c:	08 00 00 
    base.s.size = 0;
 80f:	c7 05 84 08 00 00 00 	movl   $0x0,0x884
 816:	00 00 00 
 819:	e9 45 ff ff ff       	jmp    763 <malloc+0x23>

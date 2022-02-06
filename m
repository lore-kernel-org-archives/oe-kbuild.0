Content-Type: multipart/mixed; boundary="===============5628048379603800608=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [asahilinux:smc/work 7/11] lib/vsprintf.c:1766:6: warning: Value stored to 'val' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 06 Feb 2022 20:42:07 +0800
Message-ID: <202202062030.qFafSWOV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5628048379603800608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux smc/work
head:   fc848a39b71518ca1661de7057b87cb0e8cac9f9
commit: 0e3932a4e2deead01a96dd51a0b3676f55ea80f6 [7/11] lib/vsprintf: Add s=
upport for generic FOURCCs by extending %p4cc
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20206/202202062030.qFafSWOV-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6daaf5=
a44925592c764c59219b0024ee06317028)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/0e3932a4e2deead01a96dd=
51a0b3676f55ea80f6
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux smc/work
        git checkout 0e3932a4e2deead01a96dd51a0b3676f55ea80f6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   lib/vsprintf.c:1319:2: note: Control jumps to the 'default' case at line=
 1335
           switch (fmt[2]) {
           ^
   lib/vsprintf.c:1338:3: note:  Execution continues on line 1340
                   break;
                   ^
   lib/vsprintf.c:1340:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < 4; i++) {
           ^
   lib/vsprintf.c:1342:16: note: Calling 'put_dec_trunc8'
                   int digits =3D put_dec_trunc8(temp, addr[index]) - temp;
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:220:6: note: Assuming 'r' is >=3D 100
           if (r < 100)
               ^~~~~~~
   lib/vsprintf.c:220:2: note: Taking false branch
           if (r < 100)
           ^
   lib/vsprintf.c:229:6: note: Assuming 'q' is >=3D 100
           if (q < 100)
               ^~~~~~~
   lib/vsprintf.c:229:2: note: Taking false branch
           if (q < 100)
           ^
   lib/vsprintf.c:238:6: note: Assuming 'r' is < 100
           if (r < 100)
               ^~~~~~~
   lib/vsprintf.c:238:2: note: Taking true branch
           if (r < 100)
           ^
   lib/vsprintf.c:239:3: note: Control jumps to line 250
                   goto out_r;
                   ^
   lib/vsprintf.c:251:9: note: Assuming 'r' is >=3D 10
           buf +=3D r < 10 ? 1 : 2;
                  ^~~~~~
   lib/vsprintf.c:251:9: note: '?' condition is false
   lib/vsprintf.c:1342:16: note: Returning from 'put_dec_trunc8'
                   int digits =3D put_dec_trunc8(temp, addr[index]) - temp;
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:1343:7: note: Assuming 'leading_zeros' is false
                   if (leading_zeros) {
                       ^~~~~~~~~~~~~
   lib/vsprintf.c:1343:3: note: Taking false branch
                   if (leading_zeros) {
                   ^
   lib/vsprintf.c:1350:10: note: The value 5 is assigned to 'digits'
                   while (digits--)
                          ^~~~~~~~
   lib/vsprintf.c:1350:3: note: Loop condition is true.  Entering loop body
                   while (digits--)
                   ^
   lib/vsprintf.c:1351:9: note: Assigned value is garbage or undefined
                           *p++ =3D temp[digits];
                                ^ ~~~~~~~~~~~~
   lib/vsprintf.c:1414:4: warning: Value stored to 'needcolon' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           needcolon =3D false;
                           ^           ~~~~~
   lib/vsprintf.c:1414:4: note: Value stored to 'needcolon' is never read
                           needcolon =3D false;
                           ^           ~~~~~
   lib/vsprintf.c:1684:2: warning: Uninitialized va_list is copied [clang-a=
nalyzer-valist.Uninitialized]
           va_copy(va, *va_fmt->va);
           ^
   include/linux/stdarg.h:9:23: note: expanded from macro 'va_copy'
   #define va_copy(d, s)   __builtin_va_copy(d, s)
                           ^
   lib/vsprintf.c:3093:2: note: Loop condition is true.  Entering loop body
           while (*fmt) {
           ^
   lib/vsprintf.c:3098:3: note: Control jumps to 'case FORMAT_TYPE_PTR:'  a=
t line 3133
                   switch (spec.type) {
                   ^
   lib/vsprintf.c:3135:4: note: Control jumps to the 'default' case at line=
 3144
                           switch (*fmt) {
                           ^
   lib/vsprintf.c:3145:9: note: Assuming the condition is false
                                   if (!isalnum(*fmt)) {
                                       ^~~~~~~~~~~~~~
   lib/vsprintf.c:3145:5: note: Taking false branch
                                   if (!isalnum(*fmt)) {
                                   ^
   lib/vsprintf.c:3149:11: note: Calling 'pointer'
                                   str =3D pointer(fmt, str, end, va_arg(ar=
gs, void *),
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   lib/vsprintf.c:2416:2: note: Control jumps to 'case 86:'  at line 2454
           switch (*fmt) {
           ^
   lib/vsprintf.c:2455:10: note: Calling 'va_format'
                   return va_format(buf, end, ptr, spec, fmt);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:1681:2: note: Taking false branch
           if (check_pointer(&buf, end, va_fmt, spec))
           ^
   lib/vsprintf.c:1684:2: note: Uninitialized va_list is copied
           va_copy(va, *va_fmt->va);
           ^
   include/linux/stdarg.h:9:23: note: expanded from macro 'va_copy'
   #define va_copy(d, s)   __builtin_va_copy(d, s)
                           ^~~~~~~~~~~~~~~~~~~~~~~
>> lib/vsprintf.c:1766:6: warning: Value stored to 'val' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           u32 val =3D *fourcc;
               ^~~   ~~~~~~~
   lib/vsprintf.c:1766:6: note: Value stored to 'val' during its initializa=
tion is never read
           u32 val =3D *fourcc;
               ^~~   ~~~~~~~
>> lib/vsprintf.c:1767:6: warning: Value stored to 'cval' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           u32 cval =3D *fourcc;
               ^~~~   ~~~~~~~
   lib/vsprintf.c:1767:6: note: Value stored to 'cval' during its initializ=
ation is never read
           u32 cval =3D *fourcc;
               ^~~~   ~~~~~~~
   lib/vsprintf.c:1806:3: warning: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-e=
ndian");
                   ^~~~~~
   lib/vsprintf.c:1806:3: note: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119
                   strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-e=
ndian");
                   ^~~~~~
   lib/vsprintf.c:3152:13: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]
                                           *str++ =3D '\0';
                                           ~~~~~~~^~~~~~
   lib/vsprintf.c:3093:2: note: Loop condition is true.  Entering loop body
           while (*fmt) {
           ^
   lib/vsprintf.c:3098:3: note: Control jumps to 'case FORMAT_TYPE_PTR:'  a=
t line 3133
                   switch (spec.type) {
                   ^
   lib/vsprintf.c:3135:4: note: Control jumps to the 'default' case at line=
 3144
                           switch (*fmt) {
                           ^
   lib/vsprintf.c:3145:9: note: Assuming the condition is false
                                   if (!isalnum(*fmt)) {
                                       ^~~~~~~~~~~~~~
   lib/vsprintf.c:3145:5: note: Taking false branch
                                   if (!isalnum(*fmt)) {
                                   ^
   lib/vsprintf.c:3151:9: note: Assuming the condition is true
                                   if (str + 1 < end)
                                       ^~~~~~~~~~~~~
   lib/vsprintf.c:3151:5: note: Taking true branch
                                   if (str + 1 < end)
                                   ^
   lib/vsprintf.c:3152:7: note: Null pointer value stored to 'str'
                                           *str++ =3D '\0';
                                            ^~~~~
   lib/vsprintf.c:3152:13: note: Dereference of null pointer
                                           *str++ =3D '\0';
                                           ~~~~~~~^~~~~~
   lib/vsprintf.c:3154:14: warning: Array access (from variable 'end') resu=
lts in a null pointer dereference [clang-analyzer-core.NullDereference]
                                           end[-1] =3D '\0'; /* Must be nul=
 terminated */
                                           ~~~     ^
   lib/vsprintf.c:3067:2: note: Value assigned to 'end'
           end =3D (char *)(bin_buf + size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:3093:2: note: Loop condition is true.  Entering loop body
           while (*fmt) {
           ^
   lib/vsprintf.c:3098:3: note: Control jumps to 'case FORMAT_TYPE_PTR:'  a=
t line 3133
                   switch (spec.type) {
                   ^
   lib/vsprintf.c:3135:4: note: Control jumps to the 'default' case@line=
 3144
                           switch (*fmt) {
                           ^
   lib/vsprintf.c:3145:9: note: Assuming the condition is false
                                   if (!isalnum(*fmt)) {
                                       ^~~~~~~~~~~~~~
   lib/vsprintf.c:3145:5: note: Taking false branch
                                   if (!isalnum(*fmt)) {
                                   ^
   lib/vsprintf.c:3151:9: note: Assuming pointer value is null
                                   if (str + 1 < end)
                                       ^~~~~~~~~~~~~
   lib/vsprintf.c:3151:5: note: Taking false branch
                                   if (str + 1 < end)
                                   ^
   lib/vsprintf.c:3154:14: note: Array access (from variable 'end') results=
 in a null pointer dereference
                                           end[-1] =3D '\0'; /* Must be nul=
 terminated */
                                           ~~~     ^
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/ocfs2/cluster/nodemanager.c:593:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(node->nd_name, name); /* use item.ci_namebuf instead? */
           ^~~~~~
   fs/ocfs2/cluster/nodemanager.c:593:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(node->nd_name, name); /* use item.ci_namebuf instead? */
           ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/val +1766 lib/vsprintf.c

c8f44affb7244f Micha=C5=82 Miros=C5=82aw 2011-11-15  1757  =

af612e43de6d27 Sakari Ailus    2021-02-16  1758  static noinline_for_stack
af612e43de6d27 Sakari Ailus    2021-02-16  1759  char *fourcc_string(char *=
buf, char *end, const u32 *fourcc,
af612e43de6d27 Sakari Ailus    2021-02-16  1760  		    struct printf_spec s=
pec, const char *fmt)
af612e43de6d27 Sakari Ailus    2021-02-16  1761  {
af612e43de6d27 Sakari Ailus    2021-02-16  1762  	char output[sizeof("0123 =
little-endian (0x01234567)")];
af612e43de6d27 Sakari Ailus    2021-02-16  1763  	char *p =3D output;
af612e43de6d27 Sakari Ailus    2021-02-16  1764  	unsigned int i;
0e3932a4e2deea Hector Martin   2022-02-01  1765  	bool pix_fmt =3D false;
0e3932a4e2deea Hector Martin   2022-02-01 @1766  	u32 val =3D *fourcc;
0e3932a4e2deea Hector Martin   2022-02-01 @1767  	u32 cval =3D *fourcc;
af612e43de6d27 Sakari Ailus    2021-02-16  1768  =

0e3932a4e2deea Hector Martin   2022-02-01  1769  	if (fmt[1] !=3D 'c')
af612e43de6d27 Sakari Ailus    2021-02-16  1770  		return error_string(buf,=
 end, "(%p4?)", spec);
af612e43de6d27 Sakari Ailus    2021-02-16  1771  =

af612e43de6d27 Sakari Ailus    2021-02-16  1772  	if (check_pointer(&buf, e=
nd, fourcc, spec))
af612e43de6d27 Sakari Ailus    2021-02-16  1773  		return buf;
af612e43de6d27 Sakari Ailus    2021-02-16  1774  =

0e3932a4e2deea Hector Martin   2022-02-01  1775  	switch (fmt[2]) {
0e3932a4e2deea Hector Martin   2022-02-01  1776  	case 'h':
0e3932a4e2deea Hector Martin   2022-02-01  1777  		cval =3D val =3D *fourcc;
0e3932a4e2deea Hector Martin   2022-02-01  1778  		break;
0e3932a4e2deea Hector Martin   2022-02-01  1779  	case 'r':
0e3932a4e2deea Hector Martin   2022-02-01  1780  		cval =3D val =3D swab32(=
*fourcc);
0e3932a4e2deea Hector Martin   2022-02-01  1781  		break;
0e3932a4e2deea Hector Martin   2022-02-01  1782  	case 'l':
0e3932a4e2deea Hector Martin   2022-02-01  1783  		cval =3D val =3D le32_to=
_cpu(*fourcc);
0e3932a4e2deea Hector Martin   2022-02-01  1784  		break;
0e3932a4e2deea Hector Martin   2022-02-01  1785  	case 'b':
0e3932a4e2deea Hector Martin   2022-02-01  1786  		cval =3D val =3D be32_to=
_cpu(*fourcc);
0e3932a4e2deea Hector Martin   2022-02-01  1787  		break;
0e3932a4e2deea Hector Martin   2022-02-01  1788  	case 'c':
af612e43de6d27 Sakari Ailus    2021-02-16  1789  		val =3D *fourcc & ~BIT(3=
1);
0e3932a4e2deea Hector Martin   2022-02-01  1790  		/* Pixel formats are pri=
nted LSB-first */
0e3932a4e2deea Hector Martin   2022-02-01  1791  		cval =3D swab32(val);
0e3932a4e2deea Hector Martin   2022-02-01  1792  		pix_fmt =3D true;
0e3932a4e2deea Hector Martin   2022-02-01  1793  		break;
0e3932a4e2deea Hector Martin   2022-02-01  1794  	default:
0e3932a4e2deea Hector Martin   2022-02-01  1795  		return error_string(buf,=
 end, "(%p4?)", spec);
0e3932a4e2deea Hector Martin   2022-02-01  1796  	}
af612e43de6d27 Sakari Ailus    2021-02-16  1797  =

af612e43de6d27 Sakari Ailus    2021-02-16  1798  	for (i =3D 0; i < sizeof(=
*fourcc); i++) {
0e3932a4e2deea Hector Martin   2022-02-01  1799  		unsigned char c =3D cval=
 >> ((3 - i) * 8);
af612e43de6d27 Sakari Ailus    2021-02-16  1800  =

af612e43de6d27 Sakari Ailus    2021-02-16  1801  		/* Print non-control ASC=
II characters as-is, dot otherwise */
af612e43de6d27 Sakari Ailus    2021-02-16  1802  		*p++ =3D isascii(c) && i=
sprint(c) ? c : '.';
af612e43de6d27 Sakari Ailus    2021-02-16  1803  	}
af612e43de6d27 Sakari Ailus    2021-02-16  1804  =

0e3932a4e2deea Hector Martin   2022-02-01  1805  	if (pix_fmt) {
af612e43de6d27 Sakari Ailus    2021-02-16  1806  		strcpy(p, *fourcc & BIT(=
31) ? " big-endian" : " little-endian");
af612e43de6d27 Sakari Ailus    2021-02-16  1807  		p +=3D strlen(p);
0e3932a4e2deea Hector Martin   2022-02-01  1808  	}
af612e43de6d27 Sakari Ailus    2021-02-16  1809  =

af612e43de6d27 Sakari Ailus    2021-02-16  1810  	*p++ =3D ' ';
af612e43de6d27 Sakari Ailus    2021-02-16  1811  	*p++ =3D '(';
0e3932a4e2deea Hector Martin   2022-02-01  1812  	p =3D special_hex_number(=
p, output + sizeof(output) - 2, val, sizeof(u32));
af612e43de6d27 Sakari Ailus    2021-02-16  1813  	*p++ =3D ')';
af612e43de6d27 Sakari Ailus    2021-02-16  1814  	*p =3D '\0';
af612e43de6d27 Sakari Ailus    2021-02-16  1815  =

af612e43de6d27 Sakari Ailus    2021-02-16  1816  	return string(buf, end, o=
utput, spec);
af612e43de6d27 Sakari Ailus    2021-02-16  1817  }
af612e43de6d27 Sakari Ailus    2021-02-16  1818  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5628048379603800608==--


Content-Type: multipart/mixed; boundary="===============6965223644862567630=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: security/integrity/evm/evm_secfs.c:159:3: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length argument...
Date: Sun, 10 Apr 2022 08:31:27 +0800
Message-ID: <202204100812.FI25qn4e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6965223644862567630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e1f700ebd6bea293abe3c7e2807b252018efde01
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   4 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220408 (https://download.01.org/0day-ci/archi=
ve/20220410/202204100812.FI25qn4e-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51=
b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   mm/page-writeback.c:2897:7: note: 'ret' is true
           if (!ret) {
                ^~~
   mm/page-writeback.c:2897:2: note: Taking false branch
           if (!ret) {
           ^
   mm/page-writeback.c:2902:15: note: Calling 'arch_make_folio_accessible'
           access_ret =3D arch_make_folio_accessible(folio);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:1694:2: note: 'ret' declared without an initial value
           int ret;
           ^~~~~~~
   include/linux/mm.h:1697:14: note: Assuming 'i' is >=3D 'nr'
           for (i =3D 0; i < nr; i++) {
                       ^~~~~~
   include/linux/mm.h:1697:2: note: Loop condition is false. Execution cont=
inues on line 1703
           for (i =3D 0; i < nr; i++) {
           ^
   include/linux/mm.h:1703:2: note: Undefined or garbage value returned to =
caller
           return ret;
           ^      ~~~
   mm/page-writeback.c:637:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dom, 0, sizeof(*dom));
           ^~~~~~
   mm/page-writeback.c:637:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(dom, 0, sizeof(*dom));
           ^~~~~~
   mm/page-writeback.c:1413:14: warning: The result of the left shift is un=
defined because the right operand is negative [clang-analyzer-core.Undefine=
dBinaryOperatorResult]
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                              ^
   mm/page-writeback.c:1566:47: note: '?' condition is false
           struct dirty_throttle_control * const mdtc =3D mdtc_valid(&mdtc_=
stor) ?
                                                        ^
   mm/page-writeback.c:1582:2: note: Loop condition is true.  Entering loop=
 body
           for (;;) {
           ^
   mm/page-writeback.c:1595:7: note: Assuming 'strictlimit' is false
                   if (unlikely(strictlimit)) {
                       ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   mm/page-writeback.c:1595:3: note: Taking false branch
                   if (unlikely(strictlimit)) {
                   ^
   mm/page-writeback.c:1607:7: note: 'mdtc' is null
                   if (mdtc) {
                       ^~~~
   mm/page-writeback.c:1607:3: note: Taking false branch
                   if (mdtc) {
                   ^
   mm/page-writeback.c:1645:7: note: Assuming the condition is true
                   if (dirty <=3D dirty_freerun_ceiling(thresh, bg_thresh) =
&&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:1645:7: note: Left side of '&&' is true
   mm/page-writeback.c:1646:9: note: 'mdtc' is null
                       (!mdtc ||
                         ^~~~
   mm/page-writeback.c:1646:14: note: Left side of '||' is true
                       (!mdtc ||
                              ^
   mm/page-writeback.c:1652:11: note: Calling 'dirty_poll_interval'
                           intv =3D dirty_poll_interval(dirty, thresh);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:1412:6: note: Assuming 'thresh' is > 'dirty'
           if (thresh > dirty)
               ^~~~~~~~~~~~~~
   mm/page-writeback.c:1412:2: note: Taking true branch
           if (thresh > dirty)
           ^
   mm/page-writeback.c:1413:18: note: '?' condition is false
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                                  ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   mm/page-writeback.c:1413:18: note: '?' condition is true
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                                  ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   mm/page-writeback.c:1413:14: note: The result of the left shift is undef=
ined because the right operand is negative
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                              ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:2902:2: warning: Value stored to 'access_ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           access_ret =3D arch_make_folio_accessible(folio);
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:2902:2: note: Value stored to 'access_ret' is never =
read
           access_ret =3D arch_make_folio_accessible(folio);
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   security/integrity/evm/evm_secfs.c:48:2: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(temp, "%d", (evm_initialized & ~EVM_SETUP_COMPLETE));
           ^~~~~~~
   security/integrity/evm/evm_secfs.c:48:2: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(temp, "%d", (evm_initialized & ~EVM_SETUP_COMPLETE));
           ^~~~~~~
>> security/integrity/evm/evm_secfs.c:159:3: warning: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUns=
afeBufferHandling]
                   sprintf(temp + offset, "%s\n", xattr->name);
                   ^~~~~~~
   security/integrity/evm/evm_secfs.c:159:3: note: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11
                   sprintf(temp + offset, "%s\n", xattr->name);
                   ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   crypto/poly1305_generic.c:49:4: warning: Value stored to 'src' is never =
read [clang-analyzer-deadcode.DeadStores]
                           src +=3D POLY1305_BLOCK_SIZE;
                           ^
   crypto/poly1305_generic.c:49:4: note: Value stored to 'src' is never read
   crypto/poly1305_generic.c:80:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dctx->buf + dctx->buflen, src, bytes);
                   ^~~~~~
   crypto/poly1305_generic.c:80:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dctx->buf + dctx->buflen, src, bytes);
                   ^~~~~~
   crypto/poly1305_generic.c:100:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dctx->buf, src, srclen);
                   ^~~~~~
   crypto/poly1305_generic.c:100:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dctx->buf, src, srclen);
                   ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   crypto/asymmetric_keys/x509_cert_parser.c:404:3: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer,
                   ^~~~~~
   crypto/asymmetric_keys/x509_cert_parser.c:404:3: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer,
                   ^~~~~~
   crypto/asymmetric_keys/x509_cert_parser.c:408:3: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer + ctx->o_size + 2,
                   ^~~~~~
   crypto/asymmetric_keys/x509_cert_parser.c:408:3: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer + ctx->o_size + 2,
                   ^~~~~~
   crypto/asymmetric_keys/x509_cert_parser.c:428:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer, name, namesize);
           ^~~~~~
   crypto/asymmetric_keys/x509_cert_parser.c:428:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buffer, name, namesize);
           ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   crypto/asymmetric_keys/x509_public_key.c:214:6: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p =3D memcpy(desc, cert->subject, sulen);
               ^~~~~~
   crypto/asymmetric_keys/x509_public_key.c:214:6: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           p =3D memcpy(desc, cert->subject, sulen);
               ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   crypto/wp512.c:993:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(wctx->bitLength, 0, 32);
           ^~~~~~
   crypto/wp512.c:993:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(wctx->bitLength, 0, 32);
           ^~~~~~
   crypto/wp512.c:1079:4: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&buffer[bufferPos], 0, WP512_BLOCK_SIZE -=
 bufferPos);
                           ^~~~~~
   crypto/wp512.c:1079:4: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                           memset(&buffer[bufferPos], 0, WP512_BLOCK_SIZE -=
 bufferPos);
                           ^~~~~~
   crypto/wp512.c:1084:3: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&buffer[bufferPos], 0,
                   ^~~~~~
   crypto/wp512.c:1084:3: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                   memset(&buffer[bufferPos], 0,
                   ^~~~~~
   crypto/wp512.c:1087:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&buffer[WP512_BLOCK_SIZE - WP512_LENGTHBYTES],
           ^~~~~~
   crypto/wp512.c:1087:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(&buffer[WP512_BLOCK_SIZE - WP512_LENGTHBYTES],
           ^~~~~~
   crypto/wp512.c:1103:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(out, D, WP384_DIGEST_SIZE);
           ^~~~~~
   crypto/wp512.c:1103:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(out, D, WP384_DIGEST_SIZE);
           ^~~~~~
   crypto/wp512.c:1114:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]

vim +159 security/integrity/evm/evm_secfs.c

66dbc325afcef9 Mimi Zohar      2011-03-15  115  =

fa516b66a1bfce Matthew Garrett 2018-05-15  116  #ifdef CONFIG_EVM_ADD_XATTRS
fa516b66a1bfce Matthew Garrett 2018-05-15  117  /**
fa516b66a1bfce Matthew Garrett 2018-05-15  118   * evm_read_xattrs - read()=
 for <securityfs>/evm_xattrs
fa516b66a1bfce Matthew Garrett 2018-05-15  119   *
fa516b66a1bfce Matthew Garrett 2018-05-15  120   * @filp: file pointer, not=
 actually used
fa516b66a1bfce Matthew Garrett 2018-05-15  121   * @buf: where to put the r=
esult
fa516b66a1bfce Matthew Garrett 2018-05-15  122   * @count: maximum to send =
along
fa516b66a1bfce Matthew Garrett 2018-05-15  123   * @ppos: where to start
fa516b66a1bfce Matthew Garrett 2018-05-15  124   *
fa516b66a1bfce Matthew Garrett 2018-05-15  125   * Returns number of bytes =
read or error code, as appropriate
fa516b66a1bfce Matthew Garrett 2018-05-15  126   */
fa516b66a1bfce Matthew Garrett 2018-05-15  127  static ssize_t evm_read_xat=
trs(struct file *filp, char __user *buf,
fa516b66a1bfce Matthew Garrett 2018-05-15  128  			       size_t count, lof=
f_t *ppos)
fa516b66a1bfce Matthew Garrett 2018-05-15  129  {
fa516b66a1bfce Matthew Garrett 2018-05-15  130  	char *temp;
fa516b66a1bfce Matthew Garrett 2018-05-15  131  	int offset =3D 0;
fa516b66a1bfce Matthew Garrett 2018-05-15  132  	ssize_t rc, size =3D 0;
fa516b66a1bfce Matthew Garrett 2018-05-15  133  	struct xattr_list *xattr;
fa516b66a1bfce Matthew Garrett 2018-05-15  134  =

fa516b66a1bfce Matthew Garrett 2018-05-15  135  	if (*ppos !=3D 0)
fa516b66a1bfce Matthew Garrett 2018-05-15  136  		return 0;
fa516b66a1bfce Matthew Garrett 2018-05-15  137  =

fa516b66a1bfce Matthew Garrett 2018-05-15  138  	rc =3D mutex_lock_interrup=
tible(&xattr_list_mutex);
fa516b66a1bfce Matthew Garrett 2018-05-15  139  	if (rc)
fa516b66a1bfce Matthew Garrett 2018-05-15  140  		return -ERESTARTSYS;
fa516b66a1bfce Matthew Garrett 2018-05-15  141  =

8c7a703ec9787a Roberto Sassu   2021-05-28  142  	list_for_each_entry(xattr,=
 &evm_config_xattrnames, list) {
8c7a703ec9787a Roberto Sassu   2021-05-28  143  		if (!xattr->enabled)
8c7a703ec9787a Roberto Sassu   2021-05-28  144  			continue;
8c7a703ec9787a Roberto Sassu   2021-05-28  145  =

fa516b66a1bfce Matthew Garrett 2018-05-15  146  		size +=3D strlen(xattr->n=
ame) + 1;
8c7a703ec9787a Roberto Sassu   2021-05-28  147  	}
fa516b66a1bfce Matthew Garrett 2018-05-15  148  =

fa516b66a1bfce Matthew Garrett 2018-05-15  149  	temp =3D kmalloc(size + 1,=
 GFP_KERNEL);
b5c90a7526fe39 Dan Carpenter   2018-06-01  150  	if (!temp) {
b5c90a7526fe39 Dan Carpenter   2018-06-01  151  		mutex_unlock(&xattr_list_=
mutex);
fa516b66a1bfce Matthew Garrett 2018-05-15  152  		return -ENOMEM;
b5c90a7526fe39 Dan Carpenter   2018-06-01  153  	}
fa516b66a1bfce Matthew Garrett 2018-05-15  154  =

fa516b66a1bfce Matthew Garrett 2018-05-15  155  	list_for_each_entry(xattr,=
 &evm_config_xattrnames, list) {
8c7a703ec9787a Roberto Sassu   2021-05-28  156  		if (!xattr->enabled)
8c7a703ec9787a Roberto Sassu   2021-05-28  157  			continue;
8c7a703ec9787a Roberto Sassu   2021-05-28  158  =

fa516b66a1bfce Matthew Garrett 2018-05-15 @159  		sprintf(temp + offset, "%=
s\n", xattr->name);
fa516b66a1bfce Matthew Garrett 2018-05-15  160  		offset +=3D strlen(xattr-=
>name) + 1;
fa516b66a1bfce Matthew Garrett 2018-05-15  161  	}
fa516b66a1bfce Matthew Garrett 2018-05-15  162  =

fa516b66a1bfce Matthew Garrett 2018-05-15  163  	mutex_unlock(&xattr_list_m=
utex);
fa516b66a1bfce Matthew Garrett 2018-05-15  164  	rc =3D simple_read_from_bu=
ffer(buf, count, ppos, temp, strlen(temp));
fa516b66a1bfce Matthew Garrett 2018-05-15  165  =

825b8650dc3dd0 Colin Ian King  2018-05-27  166  	kfree(temp);
825b8650dc3dd0 Colin Ian King  2018-05-27  167  =

fa516b66a1bfce Matthew Garrett 2018-05-15  168  	return rc;
fa516b66a1bfce Matthew Garrett 2018-05-15  169  }
fa516b66a1bfce Matthew Garrett 2018-05-15  170  =


:::::: The code at line 159 was first introduced by commit
:::::: fa516b66a1bfce1d72f1620c54bdfebc493000d1 EVM: Allow runtime modifica=
tion of the set of verified xattrs

:::::: TO: Matthew Garrett <mjg59@google.com>
:::::: CC: Mimi Zohar <zohar@linux.vnet.ibm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6965223644862567630==--


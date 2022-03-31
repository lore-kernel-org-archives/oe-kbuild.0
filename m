Content-Type: multipart/mixed; boundary="===============2782768705627676023=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/isdn/mISDN/dsp_pipeline.c:45:8: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments ...
Date: Thu, 31 Mar 2022 21:41:09 +0800
Message-ID: <202203312123.HKFjxZXb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2782768705627676023==
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
head:   787af64d05cd528aac9ad16752d11bb1c6061bb9
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   3 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20220331 (https://download.01.org/0day-ci/arc=
hive/20220331/202203312123.HKFjxZXb-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 22a95d=
d3e6c911c2854dd75f42ba32d34840a61a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   drivers/spi/spi-zynqmp-gqspi.c:347:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(xqspi->rxbuf, &data, size);
           ^~~~~~
   drivers/spi/spi-zynqmp-gqspi.c:513:4: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&intermediate, xqspi->txbuf, 4);
                           ^~~~~~
   drivers/spi/spi-zynqmp-gqspi.c:513:4: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&intermediate, xqspi->txbuf, 4);
                           ^~~~~~
   drivers/spi/spi-zynqmp-gqspi.c:518:4: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&intermediate, xqspi->txbuf,
                           ^~~~~~
   drivers/spi/spi-zynqmp-gqspi.c:518:4: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&intermediate, xqspi->txbuf,
                           ^~~~~~
   Suppressed 43 warnings (36 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   95 warnings generated.
   net/bridge/br_input.c:294:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(skb->cb, 0, sizeof(struct br_input_skb_cb));
           ^~~~~~
   net/bridge/br_input.c:294:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(skb->cb, 0, sizeof(struct br_input_skb_cb));
           ^~~~~~
   Suppressed 94 warnings (87 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   100 warnings generated.
   net/bridge/br_ioctl.c:166:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&b, 0, sizeof(struct __bridge_info));
                   ^~~~~~
   net/bridge/br_ioctl.c:166:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(&b, 0, sizeof(struct __bridge_info));
                   ^~~~~~
   net/bridge/br_ioctl.c:168:3: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&b.designated_root, &br->designated_root, 8);
                   ^~~~~~
   net/bridge/br_ioctl.c:168:3: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                   memcpy(&b.designated_root, &br->designated_root, 8);
                   ^~~~~~
   net/bridge/br_ioctl.c:169:3: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&b.bridge_id, &br->bridge_id, 8);
                   ^~~~~~
   net/bridge/br_ioctl.c:169:3: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                   memcpy(&b.bridge_id, &br->bridge_id, 8);
                   ^~~~~~
   net/bridge/br_ioctl.c:257:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&p, 0, sizeof(struct __port_info));
                   ^~~~~~
   net/bridge/br_ioctl.c:257:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(&p, 0, sizeof(struct __port_info));
                   ^~~~~~
   net/bridge/br_ioctl.c:258:3: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&p.designated_root, &pt->designated_root, 8);
                   ^~~~~~
   net/bridge/br_ioctl.c:258:3: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                   memcpy(&p.designated_root, &pt->designated_root, 8);
                   ^~~~~~
   net/bridge/br_ioctl.c:259:3: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&p.designated_bridge, &pt->designated_bridge, 8);
                   ^~~~~~
   net/bridge/br_ioctl.c:259:3: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                   memcpy(&p.designated_bridge, &pt->designated_bridge, 8);
                   ^~~~~~
   Suppressed 94 warnings (87 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (34 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/greybus/connection.c:116:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(connection->name, sizeof(connection->name),
           ^~~~~~~~
   drivers/greybus/connection.c:116:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(connection->name, sizeof(connection->name),
           ^~~~~~~~
   Suppressed 41 warnings (34 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (34 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   Suppressed 77 warnings (70 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   Suppressed 77 warnings (70 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   80 warnings generated.
   Suppressed 80 warnings (73 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   80 warnings generated.
   Suppressed 80 warnings (73 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   81 warnings generated.
>> drivers/isdn/mISDN/dsp_pipeline.c:45:8: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
                   p +=3D sprintf(p, "Name:        %s\n%s%s%sDescription: %=
s\n\n",
                        ^~~~~~~
   drivers/isdn/mISDN/dsp_pipeline.c:45:8: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
                   p +=3D sprintf(p, "Name:        %s\n%s%s%sDescription: %=
s\n\n",
                        ^~~~~~~
   Suppressed 80 warnings (73 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   97 warnings generated.
   arch/riscv/include/asm/atomic.h:41:9: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           return READ_ONCE(v->counter);
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   mm/memcontrol.c:6345:26: note: Passing null pointer value via 2nd parame=
ter 'events'
           __memory_events_show(m, memcg->memory_events_local);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6345:2: note: Calling '__memory_events_show'
           __memory_events_show(m, memcg->memory_events_local);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6323:46: note: Passing null pointer value via 1st parame=
ter 'v'
           seq_printf(m, "low %lu\n", atomic_long_read(&events[MEMCG_LOW]));
                                                       ^~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6323:29: note: Calling 'atomic_long_read'
           seq_printf(m, "low %lu\n", atomic_long_read(&events[MEMCG_LOW]));
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1266:31: note: Passing null p=
ointer value via 1st parameter 'v'
           return arch_atomic_long_read(v);
                                        ^
   include/linux/atomic/atomic-instrumented.h:1266:9: note: Calling 'arch_a=
tomic_long_read'
           return arch_atomic_long_read(v);
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-long.h:29:28: note: Passing null pointer val=
ue via 1st parameter 'v'
           return arch_atomic64_read(v);
                                     ^
   include/linux/atomic/atomic-long.h:29:9: note: Calling 'arch_atomic64_re=
ad'
           return arch_atomic64_read(v);
                  ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/atomic.h:41:9: note: Left side of '||' is false
           return READ_ONCE(v->counter);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   arch/riscv/include/asm/atomic.h:41:9: note: Left side of '||' is false
           return READ_ONCE(v->counter);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   arch/riscv/include/asm/atomic.h:41:9: note: Left side of '||' is false
           return READ_ONCE(v->counter);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   arch/riscv/include/asm/atomic.h:41:9: note: Left side of '||' is true
           return READ_ONCE(v->counter);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   arch/riscv/include/asm/atomic.h:41:9: note: Taking false branch
           return READ_ONCE(v->counter);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)

vim +45 drivers/isdn/mISDN/dsp_pipeline.c

960366cf8dbb33 Karsten Keil 2008-07-27  35  =

960366cf8dbb33 Karsten Keil 2008-07-27  36  static ssize_t
960366cf8dbb33 Karsten Keil 2008-07-27  37  attr_show_args(struct device *d=
ev, struct device_attribute *attr, char *buf)
960366cf8dbb33 Karsten Keil 2008-07-27  38  {
960366cf8dbb33 Karsten Keil 2008-07-27  39  	struct mISDN_dsp_element *elem=
 =3D dev_get_drvdata(dev);
1ce1513f48e3bc Karsten Keil 2009-06-02  40  	int i;
1ce1513f48e3bc Karsten Keil 2009-06-02  41  	char *p =3D buf;
960366cf8dbb33 Karsten Keil 2008-07-27  42  =

960366cf8dbb33 Karsten Keil 2008-07-27  43  	*buf =3D 0;
1ce1513f48e3bc Karsten Keil 2009-06-02  44  	for (i =3D 0; i < elem->num_ar=
gs; i++)
1ce1513f48e3bc Karsten Keil 2009-06-02 @45  		p +=3D sprintf(p, "Name:     =
   %s\n%s%s%sDescription: %s\n\n",
960366cf8dbb33 Karsten Keil 2008-07-27  46  			     elem->args[i].name,
960366cf8dbb33 Karsten Keil 2008-07-27  47  			     elem->args[i].def ? "De=
fault:     " : "",
960366cf8dbb33 Karsten Keil 2008-07-27  48  			     elem->args[i].def ? ele=
m->args[i].def : "",
960366cf8dbb33 Karsten Keil 2008-07-27  49  			     elem->args[i].def ? "\n=
" : "",
960366cf8dbb33 Karsten Keil 2008-07-27  50  			     elem->args[i].desc);
960366cf8dbb33 Karsten Keil 2008-07-27  51  =

1ce1513f48e3bc Karsten Keil 2009-06-02  52  	return p - buf;
960366cf8dbb33 Karsten Keil 2008-07-27  53  }
960366cf8dbb33 Karsten Keil 2008-07-27  54  =


:::::: The code at line 45 was first introduced by commit
:::::: 1ce1513f48e3bc4d55ee672f0e39f5063a02ab7a mISDN: Fix overlapping data=
 access

:::::: TO: Karsten Keil <keil@b1-systems.de>
:::::: CC: Karsten Keil <keil@b1-systems.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2782768705627676023==--


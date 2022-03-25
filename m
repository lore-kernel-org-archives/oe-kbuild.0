Content-Type: multipart/mixed; boundary="===============2819401110149709531=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11468/14337] drivers/usb/typec/altmodes/displayport.c:396:8: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length ar...
Date: Fri, 25 Mar 2022 09:42:58 +0800
Message-ID: <202203250932.6Dh1QkdV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2819401110149709531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   dd315b5800612e6913343524aa9b993f9a8bb0cf
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 [11468/14337] Kbuild: move=
 to -std=3Dgnu11
:::::: branch date: 18 hours ago
:::::: commit date: 12 days ago
config: arm-randconfig-c002-20220324 (https://download.01.org/0day-ci/archi=
ve/20220325/202203250932.6Dh1QkdV-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4520:5: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(cctx->blockState.nextCBlock->rep, updatedRepcodes.rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4570:5: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(updatedRepcodes.rep, cctx->blockState.prevCBlock->rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4570:5: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(updatedRepcodes.rep, cctx->blockState.prevCBlock->rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4650:5: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(cctx->blockState.nextCBlock->rep, updatedRepcodes.rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4650:5: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(cctx->blockState.nextCBlock->rep, updatedRepcodes.rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:5096:5: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memset(&params, 0, sizeof(params));
       ^
   lib/zstd/compress/../common/zstd_deps.h:34:28: note: expanded from macro=
 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:5096:5: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
       ZSTD_memset(&params, 0, sizeof(params));
       ^
   lib/zstd/compress/../common/zstd_deps.h:34:28: note: expanded from macro=
 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   lib/zstd/compress/zstd_compress_literals.c:38:5: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(ostart + flSize, src, srcSize);
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_literals.c:38:5: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(ostart + flSize, src, srcSize);
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_literals.c:89:5: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(nextHuf, prevHuf, sizeof(*prevHuf));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_literals.c:89:5: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(nextHuf, prevHuf, sizeof(*prevHuf));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_literals.c:121:9: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ZSTD_memcpy(nextHuf, prevHuf, sizeof(*prevHuf));
           ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_literals.c:121:9: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           ZSTD_memcpy(nextHuf, prevHuf, sizeof(*prevHuf));
           ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_literals.c:125:9: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ZSTD_memcpy(nextHuf, prevHuf, sizeof(*prevHuf));
           ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_literals.c:125:9: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           ZSTD_memcpy(nextHuf, prevHuf, sizeof(*prevHuf));
           ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
>> drivers/usb/typec/altmodes/displayport.c:396:8: warning: Call to functio=
n 'sprintf' is insecure as it does not provide bounding of the memory buffe=
r or security checks introduced in the C11 standard. Replace with analogous=
 functions that support length arguments or provides boundary checks such a=
s 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecate=
dOrUnsafeBufferHandling]
           len =3D sprintf(buf, "%s ", cur ? "USB" : "[USB]");
                 ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:396:8: note: Call to function '=
sprintf' is insecure as it does not provide bounding of the memory buffer o=
r security checks introduced in the C11 standard. Replace with analogous fu=
nctions that support length arguments or provides boundary checks such as '=
sprintf_s' in case of C11
           len =3D sprintf(buf, "%s ", cur ? "USB" : "[USB]");
                 ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:400:11: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                           len +=3D sprintf(buf + len, "[%s] ", configurati=
ons[i]);
                                  ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:400:11: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                           len +=3D sprintf(buf + len, "[%s] ", configurati=
ons[i]);
                                  ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:403:11: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                           len +=3D sprintf(buf + len, "%s ", configuration=
s[i]);
                                  ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:403:11: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                           len +=3D sprintf(buf + len, "%s ", configuration=
s[i]);
                                  ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:496:12: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                                   len +=3D sprintf(buf + len, "[%s] ",
                                          ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:496:12: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                                   len +=3D sprintf(buf + len, "[%s] ",
                                          ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:499:12: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                                   len +=3D sprintf(buf + len, "%s ",
                                          ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:499:12: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                                   len +=3D sprintf(buf + len, "%s ",
                                          ^~~~~~~
   Suppressed 31 warnings (30 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/char/xillybus/xillybus_class.c:66:3: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(unit->name, UNITNAMELEN, "%s", prefix);
                   ^~~~~~~~
   drivers/char/xillybus/xillybus_class.c:66:3: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(unit->name, UNITNAMELEN, "%s", prefix);
                   ^~~~~~~~
   drivers/char/xillybus/xillybus_class.c:69:3: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(unit->name, UNITNAMELEN, "%s_%02d",
                   ^~~~~~~~
   drivers/char/xillybus/xillybus_class.c:69:3: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(unit->name, UNITNAMELEN, "%s_%02d",
                   ^~~~~~~~
   drivers/char/xillybus/xillybus_class.c:118:3: warning: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(devname, sizeof(devname), "%s_%s",
                   ^~~~~~~~
   drivers/char/xillybus/xillybus_class.c:118:3: note: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(devname, sizeof(devname), "%s_%s",
                   ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/media/dvb-frontends/stv090x.c:728:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&buf[2], data, count);
           ^~~~~~
   drivers/media/dvb-frontends/stv090x.c:728:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&buf[2], data, count);
           ^~~~~~
   drivers/media/dvb-frontends/stv090x.c:2289:23: warning: The result of th=
e '/' expression is undefined [clang-analyzer-core.UndefinedBinaryOperatorR=
esult]
           steps_max =3D (car_max / inc) + 1; /* min steps =3D 3 */
                                ^
   drivers/media/dvb-frontends/stv090x.c:2405:2: note: Calling 'stv090x_get=
_loop_params'
           stv090x_get_loop_params(state, &inc, &timeout_step, &steps_max);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2251:6: note: Assuming 'car_max' i=
s <=3D 16384
           if (car_max > 0x4000)
               ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2251:2: note: Taking false branch
           if (car_max > 0x4000)
           ^
   drivers/media/dvb-frontends/stv090x.c:2260:2: note: Control jumps to 'ca=
se STV090x_SEARCH_DVBS2:'  at line 2267
           switch (state->search_mode) {
           ^
   drivers/media/dvb-frontends/stv090x.c:2270:3: note:  Execution continues=
 on line 2278
                   break;
                   ^
   drivers/media/dvb-frontends/stv090x.c:2279:7: note: Assuming 'inc' is <=
=3D 'car_max'
           if ((inc > car_max) || (inc < 0))
                ^~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2279:6: note: Left side of '||' is=
 false
           if ((inc > car_max) || (inc < 0))
               ^
   drivers/media/dvb-frontends/stv090x.c:2279:26: note: Assuming 'inc' is >=
=3D 0
           if ((inc > car_max) || (inc < 0))
                                   ^~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2279:2: note: Taking false branch
           if ((inc > car_max) || (inc < 0))
           ^
   drivers/media/dvb-frontends/stv090x.c:2283:6: note: Assuming 'srate' is =
<=3D 0
           if (srate > 0)
               ^~~~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2283:2: note: Taking false branch
           if (srate > 0)
           ^
   drivers/media/dvb-frontends/stv090x.c:2286:7: note: 'timeout' is > 100
           if ((timeout > 100) || (timeout < 0))

vim +396 drivers/usb/typec/altmodes/displayport.c

0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  381  =

0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  382  static ssize_t configurati=
on_show(struct device *dev,
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  383  				  struct device_attrib=
ute *attr, char *buf)
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  384  {
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  385  	struct dp_altmode *dp =3D=
 dev_get_drvdata(dev);
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  386  	int len;
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  387  	u8 cap;
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  388  	u8 cur;
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  389  	int i;
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  390  =

0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  391  	mutex_lock(&dp->lock);
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  392  =

0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  393  	cap =3D DP_CAP_CAPABILITY=
(dp->alt->vdo);
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  394  	cur =3D DP_CONF_CURRENTLY=
(dp->data.conf);
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  395  =

0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27 @396  	len =3D sprintf(buf, "%s =
", cur ? "USB" : "[USB]");
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  397  =

0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  398  	for (i =3D 1; i < ARRAY_S=
IZE(configurations); i++) {
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  399  		if (i =3D=3D cur)
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  400  			len +=3D sprintf(buf + =
len, "[%s] ", configurations[i]);
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  401  		else if ((i =3D=3D DP_CO=
NF_DFP_D && cap & DP_CAP_DFP_D) ||
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  402  			 (i =3D=3D DP_CONF_UFP_=
D && cap & DP_CAP_UFP_D))
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  403  			len +=3D sprintf(buf + =
len, "%s ", configurations[i]);
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  404  	}
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  405  =

0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  406  	mutex_unlock(&dp->lock);
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  407  =

0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  408  	buf[len - 1] =3D '\n';
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  409  	return len;
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  410  }
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  411  static DEVICE_ATTR_RW(conf=
iguration);
0e3bb7d6894d9b6 Heikki Krogerus 2018-06-27  412  =


:::::: The code at line 396 was first introduced by commit
:::::: 0e3bb7d6894d9b6e67d6382bb03a46a1dc989588 usb: typec: Add driver for =
DisplayPort alternate mode

:::::: TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2819401110149709531==--


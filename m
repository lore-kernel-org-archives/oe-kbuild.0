Content-Type: multipart/mixed; boundary="===============8969100507174738022=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/mips/fw/cfe/cfe_api.c:243:20: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 14 Aug 2022 08:11:19 +0800
Message-ID: <202208140802.PAlXZ9cQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8969100507174738022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/mips/fw/cfe/cfe_api.c:243:20: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Florian Fainelli <f.fainelli@gmail.com>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   69dac8e431af26173ca0a1ebc87054e01c585bcc
commit: 466ab2ea239bb85b9fd2613e3e3eb5f6c2811602 MIPS: BMIPS: Utilize cfe_d=
ie() for invalid DTB
date:   4 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 4 weeks ago
config: mips-randconfig-c004-20220808 (https://download.01.org/0day-ci/arch=
ive/20220814/202208140802.PAlXZ9cQ-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e=
2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D466ab2ea239bb85b9fd2613e3e3eb5f6c2811602
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 466ab2ea239bb85b9fd2613e3e3eb5f6c2811602
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/soundwire/stream.c:1333:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&params, &bus->params, sizeof(params));
                   ^~~~~~
   drivers/soundwire/stream.c:1333:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&params, &bus->params, sizeof(params));
                   ^~~~~~
   drivers/soundwire/stream.c:1396:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&bus->params, &params, sizeof(params));
           ^~~~~~
   drivers/soundwire/stream.c:1396:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(&bus->params, &params, sizeof(params));
           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/comedi/kcomedilib/kcomedilib_main.c:136:2: warning: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&insn, 0, sizeof(insn));
           ^~~~~~
   drivers/comedi/kcomedilib/kcomedilib_main.c:136:2: note: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11
           memset(&insn, 0, sizeof(insn));
           ^~~~~~
   drivers/comedi/kcomedilib/kcomedilib_main.c:155:2: warning: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&insn, 0, sizeof(insn));
           ^~~~~~
   drivers/comedi/kcomedilib/kcomedilib_main.c:155:2: note: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11
           memset(&insn, 0, sizeof(insn));
           ^~~~~~
   drivers/comedi/kcomedilib/kcomedilib_main.c:180:2: warning: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&insn, 0, sizeof(insn));
           ^~~~~~
   drivers/comedi/kcomedilib/kcomedilib_main.c:180:2: note: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11
           memset(&insn, 0, sizeof(insn));
           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
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
                ^~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2286:22: note: Left side of '||' i=
s true
           if ((timeout > 100) || (timeout < 0))
                               ^
   drivers/media/dvb-frontends/stv090x.c:2289:23: note: The result of the '=
/' expression is undefined
           steps_max =3D (car_max / inc) + 1; /* min steps =3D 3 */
                        ~~~~~~~~^~~~~
   drivers/media/dvb-frontends/stv090x.c:2960:2: warning: Value stored to '=
reg' is never read [clang-analyzer-deadcode.DeadStores]
           reg =3D STV090x_READ_DEMOD(state, TMGOBS);
           ^
   drivers/media/dvb-frontends/stv090x.c:2960:2: note: Value stored to 'reg=
' is never read
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> arch/mips/fw/cfe/cfe_api.c:243:20: warning: Assigned value is garbage or=
 undefined [clang-analyzer-core.uninitialized.Assign]
           info->fwi_version =3D xiocb.plist.xiocb_fwinfo.fwi_version;
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/fw/cfe/cfe_api.c:238:2: note: Calling 'cfe_iocb_dispatch'
           cfe_iocb_dispatch(&xiocb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/fw/cfe/cfe_api.c:52:6: note: Assuming 'cfe_dispfunc' is null
           if (!cfe_dispfunc)
               ^~~~~~~~~~~~~
   arch/mips/fw/cfe/cfe_api.c:52:2: note: Taking true branch
           if (!cfe_dispfunc)
           ^
   arch/mips/fw/cfe/cfe_api.c:53:3: note: Returning without writing to 'xio=
cb->plist.xiocb_fwinfo.fwi_version'
                   return -1;
                   ^
   arch/mips/fw/cfe/cfe_api.c:238:2: note: Returning from 'cfe_iocb_dispatc=
h'
           cfe_iocb_dispatch(&xiocb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/fw/cfe/cfe_api.c:240:12: note: Field 'xiocb_status' is >=3D 0
           if (xiocb.xiocb_status < 0)
                     ^
   arch/mips/fw/cfe/cfe_api.c:240:2: note: Taking false branch
           if (xiocb.xiocb_status < 0)
           ^
   arch/mips/fw/cfe/cfe_api.c:243:20: note: Assigned value is garbage or un=
defined
           info->fwi_version =3D xiocb.plist.xiocb_fwinfo.fwi_version;
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/mips/fw/cfe/cfe_api.c:430:2: warning: Call to function 'vsprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'vsprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           vsprintf(msg, fmt, ap);
           ^~~~~~~~
   arch/mips/fw/cfe/cfe_api.c:430:2: note: Call to function 'vsprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'vsprintf_s' i=
n case of C11
           vsprintf(msg, fmt, ap);
           ^~~~~~~~
>> arch/mips/fw/cfe/cfe_api.c:431:2: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(msg, "\r\n");
           ^~~~~~
   arch/mips/fw/cfe/cfe_api.c:431:2: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
           strcat(msg, "\r\n");
           ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (30 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +243 arch/mips/fw/cfe/cfe_api.c

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 227  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 228  int cfe_getfwinfo(cfe_fwinfo_t * info)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 229  {
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 230  	struct cfe_xiocb xiocb;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 231  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 232  	xiocb.xiocb_fcode =3D CFE_CMD_FW_GETINFO;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 233  	xiocb.xiocb_status =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 234  	xiocb.xiocb_handle =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 235  	xiocb.xiocb_flags =3D 0;
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 236  	xiocb.xiocb_psize =3D sizeof(struct xiocb_fwinfo);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 237  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 238  	cfe_iocb_dispatch(&xiocb);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 239  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 240  	if (xiocb.xiocb_status < 0)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 241  		return xiocb.xiocb_status;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 242  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
@243  	info->fwi_version =3D xiocb.plist.xiocb_fwinfo.fwi_version;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 244  	info->fwi_totalmem =3D xiocb.plist.xiocb_fwinfo.fwi_totalmem;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 245  	info->fwi_flags =3D xiocb.plist.xiocb_fwinfo.fwi_flags;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 246  	info->fwi_boardid =3D xiocb.plist.xiocb_fwinfo.fwi_boardid;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 247  	info->fwi_bootarea_va =3D xiocb.plist.xiocb_fwinfo.fwi_bootarea_va;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 248  	info->fwi_bootarea_pa =3D xiocb.plist.xiocb_fwinfo.fwi_bootarea_pa;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 249  	info->fwi_bootarea_size =3D
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 250  	    xiocb.plist.xiocb_fwinfo.fwi_bootarea_size;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 251  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 252  	return 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 253  }
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 254  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 255  int cfe_getstdhandle(int flg)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 256  {
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 257  	struct cfe_xiocb xiocb;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 258  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 259  	xiocb.xiocb_fcode =3D CFE_CMD_DEV_GETHANDLE;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 260  	xiocb.xiocb_status =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 261  	xiocb.xiocb_handle =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 262  	xiocb.xiocb_flags =3D flg;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 263  	xiocb.xiocb_psize =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 264  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 265  	cfe_iocb_dispatch(&xiocb);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 266  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 267  	if (xiocb.xiocb_status < 0)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 268  		return xiocb.xiocb_status;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 269  	return xiocb.xiocb_handle;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 270  }
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 271  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 272  int64_t
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 273  cfe_getticks(void)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 274  {
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 275  	struct cfe_xiocb xiocb;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 276  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 277  	xiocb.xiocb_fcode =3D CFE_CMD_FW_GETTIME;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 278  	xiocb.xiocb_status =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 279  	xiocb.xiocb_handle =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 280  	xiocb.xiocb_flags =3D 0;
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 281  	xiocb.xiocb_psize =3D sizeof(struct xiocb_time);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 282  	xiocb.plist.xiocb_time.ticks =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 283  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 284  	cfe_iocb_dispatch(&xiocb);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 285  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 286  	return xiocb.plist.xiocb_time.ticks;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 287  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 288  }
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 289  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 290  int cfe_inpstat(int handle)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 291  {
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 292  	struct cfe_xiocb xiocb;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 293  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 294  	xiocb.xiocb_fcode =3D CFE_CMD_DEV_INPSTAT;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 295  	xiocb.xiocb_status =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 296  	xiocb.xiocb_handle =3D handle;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 297  	xiocb.xiocb_flags =3D 0;
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 298  	xiocb.xiocb_psize =3D sizeof(struct xiocb_inpstat);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 299  	xiocb.plist.xiocb_inpstat.inp_status =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 300  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 301  	cfe_iocb_dispatch(&xiocb);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 302  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 303  	if (xiocb.xiocb_status < 0)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 304  		return xiocb.xiocb_status;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 305  	return xiocb.plist.xiocb_inpstat.inp_status;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 306  }
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 307  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 308  int
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 309  cfe_ioctl(int handle, unsigned int ioctlnum, unsigned char *buffer,
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 310  	  int length, int *retlen, u64 offset)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 311  {
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 312  	struct cfe_xiocb xiocb;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 313  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 314  	xiocb.xiocb_fcode =3D CFE_CMD_DEV_IOCTL;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 315  	xiocb.xiocb_status =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 316  	xiocb.xiocb_handle =3D handle;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 317  	xiocb.xiocb_flags =3D 0;
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 318  	xiocb.xiocb_psize =3D sizeof(struct xiocb_buffer);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 319  	xiocb.plist.xiocb_buffer.buf_offset =3D offset;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 320  	xiocb.plist.xiocb_buffer.buf_ioctlcmd =3D ioctlnum;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 321  	xiocb.plist.xiocb_buffer.buf_ptr =3D XPTR_FROM_NATIVE(buffer);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 322  	xiocb.plist.xiocb_buffer.buf_length =3D length;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 323  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 324  	cfe_iocb_dispatch(&xiocb);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 325  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 326  	if (retlen)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 327  		*retlen =3D xiocb.plist.xiocb_buffer.buf_retlen;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 328  	return xiocb.xiocb_status;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 329  }
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 330  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 331  int cfe_open(char *name)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 332  {
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 333  	struct cfe_xiocb xiocb;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 334  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 335  	xiocb.xiocb_fcode =3D CFE_CMD_DEV_OPEN;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 336  	xiocb.xiocb_status =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 337  	xiocb.xiocb_handle =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 338  	xiocb.xiocb_flags =3D 0;
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 339  	xiocb.xiocb_psize =3D sizeof(struct xiocb_buffer);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 340  	xiocb.plist.xiocb_buffer.buf_offset =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 341  	xiocb.plist.xiocb_buffer.buf_ptr =3D XPTR_FROM_NATIVE(name);
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 342  	xiocb.plist.xiocb_buffer.buf_length =3D strlen(name);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 343  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 344  	cfe_iocb_dispatch(&xiocb);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 345  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 346  	if (xiocb.xiocb_status < 0)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 347  		return xiocb.xiocb_status;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 348  	return xiocb.xiocb_handle;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 349  }
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 350  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 351  int cfe_read(int handle, unsigned char *buffer, int length)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 352  {
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 353  	return cfe_readblk(handle, 0, buffer, length);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 354  }
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 355  =

417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 356  int cfe_readblk(int handle, s64 offset, unsigned char *buffer, int le=
ngth)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 357  {
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 358  	struct cfe_xiocb xiocb;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 359  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 360  	xiocb.xiocb_fcode =3D CFE_CMD_DEV_READ;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 361  	xiocb.xiocb_status =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 362  	xiocb.xiocb_handle =3D handle;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 363  	xiocb.xiocb_flags =3D 0;
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 364  	xiocb.xiocb_psize =3D sizeof(struct xiocb_buffer);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 365  	xiocb.plist.xiocb_buffer.buf_offset =3D offset;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 366  	xiocb.plist.xiocb_buffer.buf_ptr =3D XPTR_FROM_NATIVE(buffer);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 367  	xiocb.plist.xiocb_buffer.buf_length =3D length;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 368  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 369  	cfe_iocb_dispatch(&xiocb);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 370  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 371  	if (xiocb.xiocb_status < 0)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 372  		return xiocb.xiocb_status;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 373  	return xiocb.plist.xiocb_buffer.buf_retlen;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 374  }
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 375  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 376  int cfe_setenv(char *name, char *val)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 377  {
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 378  	struct cfe_xiocb xiocb;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 379  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 380  	xiocb.xiocb_fcode =3D CFE_CMD_ENV_SET;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 381  	xiocb.xiocb_status =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 382  	xiocb.xiocb_handle =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 383  	xiocb.xiocb_flags =3D 0;
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 384  	xiocb.xiocb_psize =3D sizeof(struct xiocb_envbuf);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 385  	xiocb.plist.xiocb_envbuf.enum_idx =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 386  	xiocb.plist.xiocb_envbuf.name_ptr =3D XPTR_FROM_NATIVE(name);
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 387  	xiocb.plist.xiocb_envbuf.name_length =3D strlen(name);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 388  	xiocb.plist.xiocb_envbuf.val_ptr =3D XPTR_FROM_NATIVE(val);
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 389  	xiocb.plist.xiocb_envbuf.val_length =3D strlen(val);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 390  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 391  	cfe_iocb_dispatch(&xiocb);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 392  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 393  	return xiocb.xiocb_status;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 394  }
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 395  =

39b6f3aa1979ad arch/mips/fw/cfe/cfe_api.c     Markos Chandras   2013-06-17 =
 396  int cfe_write(int handle, const char *buffer, int length)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 397  {
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 398  	return cfe_writeblk(handle, 0, buffer, length);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 399  }
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 400  =

39b6f3aa1979ad arch/mips/fw/cfe/cfe_api.c     Markos Chandras   2013-06-17 =
 401  int cfe_writeblk(int handle, s64 offset, const char *buffer, int leng=
th)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 402  {
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 403  	struct cfe_xiocb xiocb;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 404  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 405  	xiocb.xiocb_fcode =3D CFE_CMD_DEV_WRITE;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 406  	xiocb.xiocb_status =3D 0;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 407  	xiocb.xiocb_handle =3D handle;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 408  	xiocb.xiocb_flags =3D 0;
417345d8f5bacc arch/mips/fw/cfe/cfe_api.c     Christoph Hellwig 2007-10-29 =
 409  	xiocb.xiocb_psize =3D sizeof(struct xiocb_buffer);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 410  	xiocb.plist.xiocb_buffer.buf_offset =3D offset;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 411  	xiocb.plist.xiocb_buffer.buf_ptr =3D XPTR_FROM_NATIVE(buffer);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 412  	xiocb.plist.xiocb_buffer.buf_length =3D length;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 413  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 414  	cfe_iocb_dispatch(&xiocb);
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 415  =

^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 416  	if (xiocb.xiocb_status < 0)
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 417  		return xiocb.xiocb_status;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 418  	return xiocb.plist.xiocb_buffer.buf_retlen;
^1da177e4c3f41 arch/mips/sibyte/cfe/cfe_api.c Linus Torvalds    2005-04-16 =
 419  }
c059ee9d77f866 arch/mips/fw/cfe/cfe_api.c     Florian Fainelli  2022-07-15 =
 420  =

c059ee9d77f866 arch/mips/fw/cfe/cfe_api.c     Florian Fainelli  2022-07-15 =
 421  void __init cfe_die(char *fmt, ...)
c059ee9d77f866 arch/mips/fw/cfe/cfe_api.c     Florian Fainelli  2022-07-15 =
 422  {
c059ee9d77f866 arch/mips/fw/cfe/cfe_api.c     Florian Fainelli  2022-07-15 =
 423  	unsigned int prid, __maybe_unused rev;
c059ee9d77f866 arch/mips/fw/cfe/cfe_api.c     Florian Fainelli  2022-07-15 =
 424  	char msg[128];
c059ee9d77f866 arch/mips/fw/cfe/cfe_api.c     Florian Fainelli  2022-07-15 =
 425  	va_list ap;
c059ee9d77f866 arch/mips/fw/cfe/cfe_api.c     Florian Fainelli  2022-07-15 =
 426  	int handle;
c059ee9d77f866 arch/mips/fw/cfe/cfe_api.c     Florian Fainelli  2022-07-15 =
 427  	unsigned int count;
c059ee9d77f866 arch/mips/fw/cfe/cfe_api.c     Florian Fainelli  2022-07-15 =
 428  =

c059ee9d77f866 arch/mips/fw/cfe/cfe_api.c     Florian Fainelli  2022-07-15 =
 429  	va_start(ap, fmt);
c059ee9d77f866 arch/mips/fw/cfe/cfe_api.c     Florian Fainelli  2022-07-15 =
@430  	vsprintf(msg, fmt, ap);
c059ee9d77f866 arch/mips/fw/cfe/cfe_api.c     Florian Fainelli  2022-07-15 =
@431  	strcat(msg, "\r\n");

:::::: The code@line 243 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8969100507174738022==--


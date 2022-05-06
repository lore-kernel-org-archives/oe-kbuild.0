Content-Type: multipart/mixed; boundary="===============0425783268754681974=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 4/4] staging: media: zoran: replace dprintk with zrdev_dbg
Date: Sat, 07 May 2022 06:40:24 +0800
Message-ID: <202205070633.LxhxdJzI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0425783268754681974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220423051839.293361-1-ian@linux.cowan.aero>
References: <20220423051839.293361-1-ian@linux.cowan.aero>
TO: Ian Cowan <ian@linux.cowan.aero>
TO: clabbe(a)baylibre.com
CC: mchehab(a)kernel.org
CC: gregkh(a)linuxfoundation.org
CC: dan.carpenter(a)oracle.com
CC: mjpeg-users(a)lists.sourceforge.net
CC: linux-media(a)vger.kernel.org
CC: linux-staging(a)lists.linux.dev
CC: ian(a)linux.cowan.aero

Hi Ian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Cowan/staging-me=
dia-zoran-add-zrdev_dbg-macros/20220425-092814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
1efba7ef1d7da5944493728c5375fef5b2130de4
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: riscv-randconfig-c006-20220505 (https://download.01.org/0day-ci/arc=
hive/20220507/202205070633.LxhxdJzI-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6febc7a1b1d282fb509=
0a6a6f6945dce452bce98
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ian-Cowan/staging-media-zoran-add-=
zrdev_dbg-macros/20220425-092814
        git checkout 6febc7a1b1d282fb5090a6a6f6945dce452bce98
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/thunderbolt/tunnel.c:1553:7: note: 'tunnel' is non-null
           if (!tunnel)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/thunderbolt/tunnel.c:1553:2: note: '?' condition is false
           if (!tunnel)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/thunderbolt/tunnel.c:1553:2: note: Taking false branch
           if (!tunnel)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/thunderbolt/tunnel.c:1556:2: note: Assuming field 'deinit' is nu=
ll
           if (tunnel->deinit)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/thunderbolt/tunnel.c:1556:2: note: '?' condition is false
           if (tunnel->deinit)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/thunderbolt/tunnel.c:1556:14: note: Field 'deinit' is null
           if (tunnel->deinit)
                       ^
   drivers/thunderbolt/tunnel.c:1556:2: note: '?' condition is false
           if (tunnel->deinit)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/thunderbolt/tunnel.c:1556:2: note: Taking false branch
           if (tunnel->deinit)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/thunderbolt/tunnel.c:1559:14: note: Assuming 'i' is < field 'npa=
ths'
           for (i =3D 0; i < tunnel->npaths; i++) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/tunnel.c:1559:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < tunnel->npaths; i++) {
           ^
   drivers/thunderbolt/tunnel.c:1560:3: note: Array access (via field 'path=
s') results in a null pointer dereference
                   if (tunnel->paths[i])
                   ^
   include/linux/compiler.h:56:46: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                ^~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 43 warnings (36 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   drivers/staging/media/zoran/videocodec.c:69:4: warning: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(codec->name + res, sizeof(codec->name) =
- res, "[%d]", h->attached);
                           ^~~~~~~~
   drivers/staging/media/zoran/videocodec.c:69:4: note: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(codec->name + res, sizeof(codec->name) =
- res, "[%d]", h->attached);
                           ^~~~~~~~
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   72 warnings generated.
>> drivers/staging/media/zoran/zr36060.c:97:16: warning: Value stored to 'z=
r' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct zoran *zr =3D videocodec_to_zoran(ptr->codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:97:16: note: Value stored to 'zr' =
during its initialization is never read
           struct zoran *zr =3D videocodec_to_zoran(ptr->codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:133:16: warning: Value stored to '=
zr' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct zoran *zr =3D videocodec_to_zoran(ptr->codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:133:16: note: Value stored to 'zr'=
 during its initialization is never read
           struct zoran *zr =3D videocodec_to_zoran(ptr->codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:248:16: warning: Value stored to '=
zr' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct zoran *zr =3D videocodec_to_zoran(ptr->codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:248:16: note: Value stored to 'zr'=
 during its initialization is never read
           struct zoran *zr =3D videocodec_to_zoran(ptr->codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:277:16: warning: Value stored to '=
zr' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct zoran *zr =3D videocodec_to_zoran(ptr->codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:277:16: note: Value stored to 'zr'=
 during its initialization is never read
           struct zoran *zr =3D videocodec_to_zoran(ptr->codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:303:16: warning: Value stored to '=
zr' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct zoran *zr =3D videocodec_to_zoran(ptr->codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:303:16: note: Value stored to 'zr'=
 during its initialization is never read
           struct zoran *zr =3D videocodec_to_zoran(ptr->codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:463:16: warning: Value stored to '=
zr' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct zoran *zr =3D videocodec_to_zoran(codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:463:16: note: Value stored to 'zr'=
 during its initialization is never read
           struct zoran *zr =3D videocodec_to_zoran(codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:481:16: warning: Value stored to '=
zr' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct zoran *zr =3D videocodec_to_zoran(codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:481:16: note: Value stored to 'zr'=
 during its initialization is never read
           struct zoran *zr =3D videocodec_to_zoran(codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:641:16: warning: Value stored to '=
zr' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct zoran *zr =3D videocodec_to_zoran(codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:641:16: note: Value stored to 'zr'=
 during its initialization is never read
           struct zoran *zr =3D videocodec_to_zoran(codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:758:16: warning: Value stored to '=
zr' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct zoran *zr =3D videocodec_to_zoran(codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:758:16: note: Value stored to 'zr'=
 during its initialization is never read
           struct zoran *zr =3D videocodec_to_zoran(codec);
                         ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/zoran/zr36060.c:799:2: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(ptr->name, sizeof(ptr->name), "zr36060[%d]", zr36060_co=
decs);
           ^~~~~~~~
   drivers/staging/media/zoran/zr36060.c:799:2: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(ptr->name, sizeof(ptr->name), "zr36060[%d]", zr36060_co=
decs);
           ^~~~~~~~
   drivers/staging/media/zoran/zr36060.c:810:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ptr->h_samp_ratio, zr36060_decimation_h, 8);
           ^~~~~~
   drivers/staging/media/zoran/zr36060.c:810:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ptr->h_samp_ratio, zr36060_decimation_h, 8);
           ^~~~~~
   drivers/staging/media/zoran/zr36060.c:811:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ptr->v_samp_ratio, zr36060_decimation_v, 8);
           ^~~~~~
   drivers/staging/media/zoran/zr36060.c:811:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ptr->v_samp_ratio, zr36060_decimation_v, 8);
           ^~~~~~
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   97 warnings generated.
   net/ipv6/udp_offload.c:94:3: warning: Call to function 'memmove' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(packet_start-frag_hdr_sz, packet_start, unfrag_l=
en);
                   ^~~~~~~
   net/ipv6/udp_offload.c:94:3: note: Call to function 'memmove' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memmove_s' in case of C11
                   memmove(packet_start-frag_hdr_sz, packet_start, unfrag_l=
en);
                   ^~~~~~~
   Suppressed 96 warnings (89 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (83 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (83 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/iio/potentiometer/ad5272.c:49:8: warning: Excessive padding in '=
struct ad5272_data' (102 padding bytes, where 38 is optimal). =

   Optimal fields order: =

   buf, =

   client, =

   cfg, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5272_data {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/iio/potentiometer/ad5272.c:49:8: note: Excessive padding in 'str=
uct ad5272_data' (102 padding bytes, where 38 is optimal). Optimal fields o=
rder: buf, client, cfg, lock, consider reordering the fields or adding expl=
icit padding members
   struct ad5272_data {

vim +/zr +97 drivers/staging/media/zoran/zr36060.c

61c3b19f7b9eb7 Corentin Labbe        2020-09-25   93  =

5e195bbddabdd9 Corentin Labbe        2020-09-25   94  /* wait if codec is r=
eady to proceed (end of processing) or time is over */
5e195bbddabdd9 Corentin Labbe        2020-09-25   95  static void zr36060_w=
ait_end(struct zr36060 *ptr)
61c3b19f7b9eb7 Corentin Labbe        2020-09-25   96  {
6febc7a1b1d282 Ian Cowan             2022-04-23  @97  	struct zoran *zr =3D=
 videocodec_to_zoran(ptr->codec);
61c3b19f7b9eb7 Corentin Labbe        2020-09-25   98  	int i =3D 0;
61c3b19f7b9eb7 Corentin Labbe        2020-09-25   99  =

c602f29dd17cad Mauro Carvalho Chehab 2020-10-01  100  	while (zr36060_read_=
status(ptr) & ZR060_CFSR_BUSY) {
61c3b19f7b9eb7 Corentin Labbe        2020-09-25  101  		udelay(1);
61c3b19f7b9eb7 Corentin Labbe        2020-09-25  102  		if (i++ > 200000) {=
	// 200ms, there is for sure something wrong!!!
6febc7a1b1d282 Ian Cowan             2022-04-23  103  			zrdev_dbg(zr, "%s:=
 timeout at wait_end (last status: 0x%02x)\n",
61c3b19f7b9eb7 Corentin Labbe        2020-09-25  104  				  ptr->name, ptr-=
>status);
61c3b19f7b9eb7 Corentin Labbe        2020-09-25  105  			break;
61c3b19f7b9eb7 Corentin Labbe        2020-09-25  106  		}
61c3b19f7b9eb7 Corentin Labbe        2020-09-25  107  	}
61c3b19f7b9eb7 Corentin Labbe        2020-09-25  108  }
61c3b19f7b9eb7 Corentin Labbe        2020-09-25  109  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0425783268754681974==--


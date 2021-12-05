Content-Type: multipart/mixed; boundary="===============6791665788043148290=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/dev/bittiming.c:172:33: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Mon, 06 Dec 2021 00:37:34 +0800
Message-ID: <202112060052.ivxi244X-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6791665788043148290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Marc Kleine-Budde" <mkl@pengutronix.de>
CC: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   79a72162048e42a677bc7336a9f5d86fc3ff9558
commit: 5a9d5ecd69ed65fc2d49cdecfc1c1ab1e4d7af34 can: dev: move bittiming r=
elated code into seperate file
date:   11 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-c004-20211203 (https://download.01.org/0day-ci/arch=
ive/20211206/202112060052.ivxi244X-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 1e328b=
06c15273edf4a40a27ca24931b5efb3a87)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D5a9d5ecd69ed65fc2d49cdecfc1c1ab1e4d7af34
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5a9d5ecd69ed65fc2d49cdecfc1c1ab1e4d7af34
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/md/dm-raid1.c:730:3: note: Calling 'bio_list_add'
                   bio_list_add(this_list, bio);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bio.h:602:6: note: Access to field 'tail' results in a der=
eference of a null pointer (loaded from variable 'bl')
           if (bl->tail)
               ^~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   crypto/asymmetric_keys/public_key.c:89:3: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
                   strcpy(alg_name, pkey->pkey_algo);
                   ^~~~~~
   crypto/asymmetric_keys/public_key.c:89:3: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
                   strcpy(alg_name, pkey->pkey_algo);
                   ^~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   lib/zstd/fse_compress.c:114:2: warning: Value stored to 'workspace' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           workspace =3D (U32 *)workspace + spaceUsed32;
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/zstd/fse_compress.c:114:2: note: Value stored to 'workspace' is neve=
r read
           workspace =3D (U32 *)workspace + spaceUsed32;
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/zstd/fse_compress.c:115:2: warning: Value stored to 'workspaceSize' =
is never read [clang-analyzer-deadcode.DeadStores]
           workspaceSize -=3D (spaceUsed32 << 2);
           ^                ~~~~~~~~~~~~~~~~~~
   lib/zstd/fse_compress.c:115:2: note: Value stored to 'workspaceSize' is =
never read
           workspaceSize -=3D (spaceUsed32 << 2);
           ^                ~~~~~~~~~~~~~~~~~~
   lib/zstd/fse_compress.c:755:2: warning: Value stored to 'srcSize' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           srcSize -=3D 2;
           ^          ~
   lib/zstd/fse_compress.c:755:2: note: Value stored to 'srcSize' is never =
read
           srcSize -=3D 2;
           ^          ~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (4 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
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
   7 warnings generated.
   drivers/clocksource/timer-of.c:191:3: warning: Value stored to 'flags' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   flags |=3D TIMER_OF_IRQ;
                   ^
   drivers/clocksource/timer-of.c:191:3: note: Value stored to 'flags' is n=
ever read
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/net/can/dev/bittiming.c:172:33: warning: Division by zero [clang=
-analyzer-core.DivideZero]
           bt->bitrate =3D priv->clock.freq /
                         ~~~~~~~~~~~~~~~~~^
   drivers/net/can/dev/bittiming.c:76:2: note: 'best_brp' initialized to 0
           unsigned int best_brp =3D 0;              /* current best value =
for brp */
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/bittiming.c:81:6: note: Assuming field 'sample_point=
' is not equal to 0
           if (bt->sample_point) {
               ^~~~~~~~~~~~~~~~
   drivers/net/can/dev/bittiming.c:81:2: note: Taking true branch
           if (bt->sample_point) {
           ^
   drivers/net/can/dev/bittiming.c:94:7: note: Assuming the condition is tr=
ue
                tseg >=3D (btc->tseg1_min + btc->tseg2_min) * 2; tseg--) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/bittiming.c:93:2: note: Loop condition is true.  Ent=
ering loop body
           for (tseg =3D (btc->tseg1_max + btc->tseg2_max) * 2 + 1;
           ^
   drivers/net/can/dev/bittiming.c:102:7: note: Assuming 'brp' is < field '=
brp_min'
                   if (brp < btc->brp_min || brp > btc->brp_max)
                       ^~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/bittiming.c:102:26: note: Left side of '||' is true
                   if (brp < btc->brp_min || brp > btc->brp_max)
                                          ^
   drivers/net/can/dev/bittiming.c:103:4: note:  Execution continues on lin=
e 94
                           continue;
                           ^
   drivers/net/can/dev/bittiming.c:94:7: note: Assuming the condition is fa=
lse
                tseg >=3D (btc->tseg1_min + btc->tseg2_min) * 2; tseg--) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/bittiming.c:93:2: note: Loop condition is false. Exe=
cution continues on line 130
           for (tseg =3D (btc->tseg1_max + btc->tseg2_max) * 2 + 1;
           ^
   drivers/net/can/dev/bittiming.c:130:6: note: 'best_bitrate_error' is 429=
4967295
           if (best_bitrate_error) {
               ^~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/bittiming.c:130:2: note: Taking true branch
           if (best_bitrate_error) {
           ^
   drivers/net/can/dev/bittiming.c:133:3: note: Left side of '&&' is false
                   do_div(v64, bt->bitrate);
                   ^
   include/asm-generic/div64.h:227:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/net/can/dev/bittiming.c:133:3: note: 4 is >=3D 4
                   do_div(v64, bt->bitrate);
                   ^
   include/asm-generic/div64.h:231:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:66:32: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                  ^~~~~~~~
   note: expanded from here
   drivers/net/can/dev/bittiming.c:133:3: note: Left side of '&&' is true
                   do_div(v64, bt->bitrate);
                   ^
   include/asm-generic/div64.h:231:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^
   include/asm-generic/div64.h:66:31: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                 ^
   drivers/net/can/dev/bittiming.c:133:3: note: Left side of '&&' is false
                   do_div(v64, bt->bitrate);
                   ^
   include/asm-generic/div64.h:232:35: note: expanded from macro 'do_div'
                      __builtin_constant_p(__base) &&      \
                                                   ^
   drivers/net/can/dev/bittiming.c:133:3: note: Taking false branch
                   do_div(v64, bt->bitrate);
                   ^
   include/asm-generic/div64.h:239:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   drivers/net/can/dev/bittiming.c:135:7: note: Assuming 'bitrate_error' is=
 <=3D CAN_CALC_MAX_ERROR
                   if (bitrate_error > CAN_CALC_MAX_ERROR) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/bittiming.c:135:3: note: Taking false branch
                   if (bitrate_error > CAN_CALC_MAX_ERROR) {
                   ^
   drivers/net/can/dev/bittiming.c:151:2: note: Left side of '&&' is false
           do_div(v64, priv->clock.freq);
           ^
   include/asm-generic/div64.h:227:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/net/can/dev/bittiming.c:151:2: note: 4 is >=3D 4
           do_div(v64, priv->clock.freq);
           ^
   include/asm-generic/div64.h:231:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:66:32: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                  ^~~~~~~~
   note: expanded from here
   drivers/net/can/dev/bittiming.c:151:2: note: Left side of '&&' is true
           do_div(v64, priv->clock.freq);
           ^

vim +172 drivers/net/can/dev/bittiming.c

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   64  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   65  int can_calc_bittiming(st=
ruct net_device *dev, struct can_bittiming *bt,
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   66  		       const struct can=
_bittiming_const *btc)
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   67  {
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   68  	struct can_priv *priv =
=3D netdev_priv(dev);
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   69  	unsigned int bitrate;			=
/* current bitrate */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   70  	unsigned int bitrate_err=
or;		/* difference between current and nominal value */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   71  	unsigned int best_bitrat=
e_error =3D UINT_MAX;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   72  	unsigned int sample_poin=
t_error;	/* difference between current and nominal value */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   73  	unsigned int best_sample=
_point_error =3D UINT_MAX;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   74  	unsigned int sample_poin=
t_nominal;	/* nominal sample point */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   75  	unsigned int best_tseg =
=3D 0;		/* current best value for tseg */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   76  	unsigned int best_brp =
=3D 0;		/* current best value for brp */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   77  	unsigned int brp, tsegal=
l, tseg, tseg1 =3D 0, tseg2 =3D 0;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   78  	u64 v64;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   79  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   80  	/* Use CiA recommended s=
ample points */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   81  	if (bt->sample_point) {
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   82  		sample_point_nominal =
=3D bt->sample_point;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   83  	} else {
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   84  		if (bt->bitrate > 80000=
0)
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   85  			sample_point_nominal =
=3D 750;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   86  		else if (bt->bitrate > =
500000)
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   87  			sample_point_nominal =
=3D 800;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   88  		else
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   89  			sample_point_nominal =
=3D 875;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   90  	}
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   91  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   92  	/* tseg even =3D round d=
own, odd =3D round up */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   93  	for (tseg =3D (btc->tseg=
1_max + btc->tseg2_max) * 2 + 1;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   94  	     tseg >=3D (btc->tse=
g1_min + btc->tseg2_min) * 2; tseg--) {
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   95  		tsegall =3D CAN_SYNC_SE=
G + tseg / 2;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   96  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   97  		/* Compute all possible=
 tseg choices (tseg=3Dtseg1+tseg2) */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   98  		brp =3D priv->clock.fre=
q / (tsegall * bt->bitrate) + tseg % 2;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11   99  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  100  		/* choose brp step whic=
h is possible in system */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  101  		brp =3D (brp / btc->brp=
_inc) * btc->brp_inc;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  102  		if (brp < btc->brp_min =
|| brp > btc->brp_max)
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  103  			continue;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  104  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  105  		bitrate =3D priv->clock=
.freq / (brp * tsegall);
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  106  		bitrate_error =3D abs(b=
t->bitrate - bitrate);
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  107  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  108  		/* tseg brp biterror */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  109  		if (bitrate_error > bes=
t_bitrate_error)
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  110  			continue;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  111  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  112  		/* reset sample point e=
rror if we have a better bitrate */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  113  		if (bitrate_error < bes=
t_bitrate_error)
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  114  			best_sample_point_erro=
r =3D UINT_MAX;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  115  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  116  		can_update_sample_point=
(btc, sample_point_nominal, tseg / 2,
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  117  					&tseg1, &tseg2, &sam=
ple_point_error);
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  118  		if (sample_point_error =
> best_sample_point_error)
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  119  			continue;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  120  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  121  		best_sample_point_error=
 =3D sample_point_error;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  122  		best_bitrate_error =3D =
bitrate_error;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  123  		best_tseg =3D tseg / 2;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  124  		best_brp =3D brp;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  125  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  126  		if (bitrate_error =3D=
=3D 0 && sample_point_error =3D=3D 0)
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  127  			break;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  128  	}
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  129  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  130  	if (best_bitrate_error) {
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  131  		/* Error in one-tenth o=
f a percent */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  132  		v64 =3D (u64)best_bitra=
te_error * 1000;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  133  		do_div(v64, bt->bitrate=
);
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  134  		bitrate_error =3D (u32)=
v64;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  135  		if (bitrate_error > CAN=
_CALC_MAX_ERROR) {
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  136  			netdev_err(dev,
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  137  				   "bitrate error %d.=
%d%% too high\n",
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  138  				   bitrate_error / 10=
, bitrate_error % 10);
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  139  			return -EDOM;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  140  		}
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  141  		netdev_warn(dev, "bitra=
te error %d.%d%%\n",
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  142  			    bitrate_error / 10=
, bitrate_error % 10);
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  143  	}
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  144  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  145  	/* real sample point */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  146  	bt->sample_point =3D can=
_update_sample_point(btc, sample_point_nominal,
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  147  						   best_tseg, &tseg=
1, &tseg2,
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  148  						   NULL);
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  149  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  150  	v64 =3D (u64)best_brp * =
1000 * 1000 * 1000;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  151  	do_div(v64, priv->clock.=
freq);
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  152  	bt->tq =3D (u32)v64;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  153  	bt->prop_seg =3D tseg1 /=
 2;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  154  	bt->phase_seg1 =3D tseg1=
 - bt->prop_seg;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  155  	bt->phase_seg2 =3D tseg2;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  156  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  157  	/* check for sjw user se=
ttings */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  158  	if (!bt->sjw || !btc->sj=
w_max) {
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  159  		bt->sjw =3D 1;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  160  	} else {
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  161  		/* bt->sjw is at least =
1 -> sanitize upper bound to sjw_max */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  162  		if (bt->sjw > btc->sjw_=
max)
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  163  			bt->sjw =3D btc->sjw_m=
ax;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  164  		/* bt->sjw must not be =
higher than tseg2 */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  165  		if (tseg2 < bt->sjw)
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  166  			bt->sjw =3D tseg2;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  167  	}
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  168  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  169  	bt->brp =3D best_brp;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  170  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  171  	/* real bitrate */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11 @172  	bt->bitrate =3D priv->cl=
ock.freq /
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  173  		(bt->brp * (CAN_SYNC_SE=
G + tseg1 + tseg2));
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  174  =

5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  175  	return 0;
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  176  }
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  177  #endif /* CONFIG_CAN_CALC=
_BITTIMING */
5a9d5ecd69ed65 Marc Kleine-Budde 2021-01-11  178  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6791665788043148290==--


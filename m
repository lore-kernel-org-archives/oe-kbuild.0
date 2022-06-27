Content-Type: multipart/mixed; boundary="===============4309854410455670248=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/staging/media/rkvdec/rkvdec-h264.c:732:45: warning: Value stored to 'dec_params' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 27 Jun 2022 03:04:30 +0000
Message-ID: <202206260426.Biwn77ee-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4309854410455670248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/s=
taging/media/rkvdec/rkvdec-h264.c:732:45: warning: Value stored to 'dec_par=
ams' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Nicolas Dufresne <nicolas.dufresne@collabora.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sebastian Fricke <sebastian.fricke@collabora.com>
CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8c23f235a6a8ae43abea215812eb9d8cf4dd165e
commit: 7ab889f09dfa70e8097ec1b9186fd228124112cb media: rkvdec: h264: Fix d=
pb_valid implementation
date:   6 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-c006-20220622
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8b8d12=
6598ce7bd5243da7f94f69fa1104288bee)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7ab889f09dfa70e8097ec1b9186fd228124112cb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7ab889f09dfa70e8097ec1b9186fd228124112cb
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/iio/adc/ti-tsc2046.c:309:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&xfer, 0, sizeof(xfer));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-tsc2046.c:309:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&xfer, 0, sizeof(xfer));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-tsc2046.c:401:9: warning: Division by zero [clang-ana=
lyzer-core.DivideZero]
           return DIV_ROUND_UP(val_normalized, valid_count);
                  ^
   include/linux/math.h:37:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                        ^
   drivers/iio/adc/ti-tsc2046.c:440:2: note: Calling 'tsc2046_adc_scan'
           tsc2046_adc_scan(indio_dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-tsc2046.c:412:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/iio/adc/ti-tsc2046.c:412:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/iio/adc/ti-tsc2046.c:417:18: note: Assuming 'group' is < field '=
groups'
           for (group =3D 0; group < priv->groups; group++)
                           ^~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-tsc2046.c:417:2: note: Loop condition is true.  Enter=
ing loop body
           for (group =3D 0; group < priv->groups; group++)
           ^
   drivers/iio/adc/ti-tsc2046.c:418:32: note: Calling 'tsc2046_adc_get_val'
                   priv->scan_buf.data[group] =3D tsc2046_adc_get_val(priv,=
 group);
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/iio/adc/ti-tsc2046.c:394:2: note: Value assigned to 'valid_count'
           valid_count =3D l->count - l->skip;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-tsc2046.c:396:14: note: Assuming 'i' is >=3D 'valid_c=
ount'
           for (i =3D 0; i < valid_count; i++) {
                       ^~~~~~~~~~~~~~~
   drivers/iio/adc/ti-tsc2046.c:396:2: note: Loop condition is false. Execu=
tion continues on line 401
           for (i =3D 0; i < valid_count; i++) {
           ^
   drivers/iio/adc/ti-tsc2046.c:401:9: note: Division by zero
           return DIV_ROUND_UP(val_normalized, valid_count);
                  ^
   include/linux/math.h:37:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/staging/media/rkvdec/rkvdec-h264.c:657:2: warning: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hw_ps, 0, sizeof(*hw_ps));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:657:2: note: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11
           memset(hw_ps, 0, sizeof(*hw_ps));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> drivers/staging/media/rkvdec/rkvdec-h264.c:732:45: warning: Value stored=
 to 'dec_params' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->d=
ecode_params;
                                                      ^~~~~~~~~~   ~~~~~~~~=
~~~~~~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:732:45: note: Value stored to=
 'dec_params' during its initialization is never read
           const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->d=
ecode_params;
                                                      ^~~~~~~~~~   ~~~~~~~~=
~~~~~~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:763:2: warning: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hw_rps, 0, sizeof(priv_tbl->rps));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:763:2: note: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11
           memset(hw_rps, 0, sizeof(priv_tbl->rps));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:826:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tbl->scaling_list.scaling_list_4x4,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:826:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(tbl->scaling_list.scaling_list_4x4,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:830:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tbl->scaling_list.scaling_list_8x8,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:830:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(tbl->scaling_list.scaling_list_8x8,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:1058:2: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(priv_tbl->cabac_table, rkvdec_h264_cabac_table,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:1058:2: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(priv_tbl->cabac_table, rkvdec_h264_cabac_table,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/dec_params +732 drivers/staging/media/rkvdec/rkvdec-h264.c

cd33c830448baf Boris Brezillon  2020-04-04  728  =

7ab889f09dfa70 Nicolas Dufresne 2022-05-13  729  static void lookup_ref_buf=
_idx(struct rkvdec_ctx *ctx,
7ab889f09dfa70 Nicolas Dufresne 2022-05-13  730  			       struct rkvdec_h2=
64_run *run)
7ab889f09dfa70 Nicolas Dufresne 2022-05-13  731  {
7ab889f09dfa70 Nicolas Dufresne 2022-05-13 @732  	const struct v4l2_ctrl_h2=
64_decode_params *dec_params =3D run->decode_params;
7ab889f09dfa70 Nicolas Dufresne 2022-05-13  733  	u32 i;
7ab889f09dfa70 Nicolas Dufresne 2022-05-13  734  =

7ab889f09dfa70 Nicolas Dufresne 2022-05-13  735  	for (i =3D 0; i < ARRAY_S=
IZE(dec_params->dpb); i++) {
7ab889f09dfa70 Nicolas Dufresne 2022-05-13  736  		struct v4l2_m2m_ctx *m2m=
_ctx =3D ctx->fh.m2m_ctx;
7ab889f09dfa70 Nicolas Dufresne 2022-05-13  737  		const struct v4l2_h264_d=
pb_entry *dpb =3D run->decode_params->dpb;
7ab889f09dfa70 Nicolas Dufresne 2022-05-13  738  		struct vb2_queue *cap_q =
=3D &m2m_ctx->cap_q_ctx.q;
7ab889f09dfa70 Nicolas Dufresne 2022-05-13  739  		int buf_idx =3D -1;
7ab889f09dfa70 Nicolas Dufresne 2022-05-13  740  =

7ab889f09dfa70 Nicolas Dufresne 2022-05-13  741  		if (dpb[i].flags & V4L2_=
H264_DPB_ENTRY_FLAG_ACTIVE)
7ab889f09dfa70 Nicolas Dufresne 2022-05-13  742  			buf_idx =3D vb2_find_ti=
mestamp(cap_q,
7ab889f09dfa70 Nicolas Dufresne 2022-05-13  743  						     dpb[i].referenc=
e_ts, 0);
7ab889f09dfa70 Nicolas Dufresne 2022-05-13  744  =

7ab889f09dfa70 Nicolas Dufresne 2022-05-13  745  		run->ref_buf_idx[i] =3D =
buf_idx;
7ab889f09dfa70 Nicolas Dufresne 2022-05-13  746  	}
7ab889f09dfa70 Nicolas Dufresne 2022-05-13  747  }
7ab889f09dfa70 Nicolas Dufresne 2022-05-13  748  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4309854410455670248==--


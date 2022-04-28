Content-Type: multipart/mixed; boundary="===============7757288313030116609=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] interconnect: Restore sync state by ignoring ipa-virt in provider count
Date: Thu, 28 Apr 2022 10:00:28 +0800
Message-ID: <202204280719.NbzuG1KX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7757288313030116609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220427013226.341209-1-swboyd@chromium.org>
References: <20220427013226.341209-1-swboyd@chromium.org>
TO: Stephen Boyd <swboyd@chromium.org>
TO: Georgi Djakov <djakov@kernel.org>
CC: linux-kernel(a)vger.kernel.org
CC: patches(a)lists.linux.dev
CC: linux-pm(a)vger.kernel.org
CC: linux-arm-msm(a)vger.kernel.org
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: Doug Anderson <dianders@chromium.org>
CC: Alex Elder <elder@linaro.org>
CC: Taniya Das <quic_tdas@quicinc.com>
CC: Mike Tipton <quic_mdtipton@quicinc.com>

Hi Stephen,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 2fb251c265608636fc961b7d38e1a03937e57371]

url:    https://github.com/intel-lab-lkp/linux/commits/Stephen-Boyd/interco=
nnect-Restore-sync-state-by-ignoring-ipa-virt-in-provider-count/20220427-09=
3336
base:   2fb251c265608636fc961b7d38e1a03937e57371
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm-randconfig-c002-20220425 (https://download.01.org/0day-ci/archi=
ve/20220428/202204280719.NbzuG1KX-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/cbf4c9cc33fb58f0160=
0f8be24ea6b9bcb591125
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stephen-Boyd/interconnect-Restore-=
sync-state-by-ignoring-ipa-virt-in-provider-count/20220427-093336
        git checkout cbf4c9cc33fb58f01600f8be24ea6b9bcb591125
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   net/netfilter/nf_log.c:250:3: warning: Call to function 'vsnprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   vsnprintf(prefix, sizeof(prefix), fmt, args);
                   ^~~~~~~~~
   net/netfilter/nf_log.c:250:3: note: Call to function 'vsnprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'vsnprintf_s' in case of C11
                   vsnprintf(prefix, sizeof(prefix), fmt, args);
                   ^~~~~~~~~
   net/netfilter/nf_log.c:273:9: warning: Call to function 'vsnprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D vsnprintf(m->buf + m->count, S_SIZE - m->count, =
f, args);
                         ^~~~~~~~~
   net/netfilter/nf_log.c:273:9: note: Call to function 'vsnprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'vsnprintf_s' in case of C11
                   len =3D vsnprintf(m->buf + m->count, S_SIZE - m->count, =
f, args);
                         ^~~~~~~~~
   Suppressed 77 warnings (76 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   114 warnings generated.
   Suppressed 114 warnings (108 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   74 warnings generated.
   Suppressed 74 warnings (74 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   109 warnings generated.
   Suppressed 109 warnings (108 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/gpu/drm/vkms/vkms_composer.c:94:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(xrgb_dst, xrgb_src, sizeof(u8) * 3);
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
   drivers/gpu/drm/vkms/vkms_composer.c:94:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(xrgb_dst, xrgb_src, sizeof(u8) * 3);
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
   drivers/gpu/drm/vkms/vkms_composer.c:195:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(*vaddr_out, vaddr, gem_obj->size);
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
   drivers/gpu/drm/vkms/vkms_composer.c:195:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(*vaddr_out, vaddr, gem_obj->size);
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
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/gnss/core.c:358:9: warning: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           return sprintf(buf, "%s\n", gnss_type_name(gdev));
                  ^~~~~~~
   drivers/gnss/core.c:358:9: note: Call to function 'sprintf' is insecure =
as it does not provide bounding of the memory buffer or security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           return sprintf(buf, "%s\n", gnss_type_name(gdev));
                  ^~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
>> drivers/interconnect/core.c:1090:28: warning: Value stored to 'ignore_li=
st' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           const struct of_device_id ignore_list[] =3D {
                                     ^~~~~~~~~~~     ~
   drivers/interconnect/core.c:1090:28: note: Value stored to 'ignore_list'=
 during its initialization is never read
           const struct of_device_id ignore_list[] =3D {
                                     ^~~~~~~~~~~     ~
   Suppressed 58 warnings (57 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/dma/sh/shdma-base.c:334:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cb, 0, sizeof(cb));
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
   drivers/dma/sh/shdma-base.c:334:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&cb, 0, sizeof(cb));
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
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   lib/lz4/lz4hc_compress.c:63:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset((void *)hc4->hashTable, 0, sizeof(hc4->hashTable));
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
   lib/lz4/lz4hc_compress.c:63:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset((void *)hc4->hashTable, 0, sizeof(hc4->hashTable));
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
   lib/lz4/lz4hc_compress.c:64:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hc4->chainTable, 0xFF, sizeof(hc4->chainTable));
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
   lib/lz4/lz4hc_compress.c:64:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(hc4->chainTable, 0xFF, sizeof(hc4->chainTable));

vim +/ignore_list +1090 drivers/interconnect/core.c

11f1ceca7031de Georgi Djakov 2019-01-16  1085  =

b1d681d8d32499 Georgi Djakov 2020-08-25  1086  static int of_count_icc_prov=
iders(struct device_node *np)
b1d681d8d32499 Georgi Djakov 2020-08-25  1087  {
b1d681d8d32499 Georgi Djakov 2020-08-25  1088  	struct device_node *child;
b1d681d8d32499 Georgi Djakov 2020-08-25  1089  	int count =3D 0;
cbf4c9cc33fb58 Stephen Boyd  2022-04-26 @1090  	const struct of_device_id i=
gnore_list[] =3D {
cbf4c9cc33fb58 Stephen Boyd  2022-04-26  1091  		{ .compatible =3D "qcom,sc=
7180-ipa-virt" },
cbf4c9cc33fb58 Stephen Boyd  2022-04-26  1092  		{ .compatible =3D "qcom,sd=
x55-ipa-virt" },
cbf4c9cc33fb58 Stephen Boyd  2022-04-26  1093  		{}
cbf4c9cc33fb58 Stephen Boyd  2022-04-26  1094  	};
b1d681d8d32499 Georgi Djakov 2020-08-25  1095  =

b1d681d8d32499 Georgi Djakov 2020-08-25  1096  	for_each_available_child_of=
_node(np, child) {
cbf4c9cc33fb58 Stephen Boyd  2022-04-26  1097  		if (of_property_read_bool(=
child, "#interconnect-cells") &&
cbf4c9cc33fb58 Stephen Boyd  2022-04-26  1098  		    likely(!of_match_node(=
ignore_list, child)))
b1d681d8d32499 Georgi Djakov 2020-08-25  1099  			count++;
b1d681d8d32499 Georgi Djakov 2020-08-25  1100  		count +=3D of_count_icc_pr=
oviders(child);
b1d681d8d32499 Georgi Djakov 2020-08-25  1101  	}
b1d681d8d32499 Georgi Djakov 2020-08-25  1102  =

b1d681d8d32499 Georgi Djakov 2020-08-25  1103  	return count;
b1d681d8d32499 Georgi Djakov 2020-08-25  1104  }
b1d681d8d32499 Georgi Djakov 2020-08-25  1105  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7757288313030116609==--


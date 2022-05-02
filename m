Content-Type: multipart/mixed; boundary="===============5469864488247230075=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [broonie-ci:20220425_ranjani_sridharan_asoc_sof_ipc_abstraction_for_fw_loading 115/123] sound/soc/sof/ipc3-loader.c:51:32: warning: Value stored to 'dbg_abi' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 02 May 2022 18:04:51 +0800
Message-ID: <202205021745.1mKvSJe3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5469864488247230075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Rander Wang <rander.wang@intel.com>
CC: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 2022=
0425_ranjani_sridharan_asoc_sof_ipc_abstraction_for_fw_loading
head:   1dd4b999dad2d8b8fce257e4c3c3d334a709c933
commit: d2458baa799fff377660d86323dd20a3f4deecb4 [115/123] ASoC: SOF: ipc3-=
loader: Implement firmware parsing and loading
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-c006-20220501 (https://download.01.org/0day-ci/arc=
hive/20220502/202205021745.1mKvSJe3-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d=
36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/co=
mmit/?id=3Dd2458baa799fff377660d86323dd20a3f4deecb4
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kern=
el/git/broonie/ci.git
        git fetch --no-tags broonie-ci 20220425_ranjani_sridharan_asoc_sof_=
ipc_abstraction_for_fw_loading
        git checkout d2458baa799fff377660d86323dd20a3f4deecb4
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~
   sound/soc/codecs/tlv320aic3x.c:162:28: note: Returning from 'fls'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                     ^~~~~~~~
   sound/soc/codecs/tlv320aic3x.c:162:25: note: The result of the left shif=
t is undefined due to shifting by '32', which is greater or equal to the wi=
dth of type 'int'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                  ^  ~~~~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   sound/soc/codecs/tscs42xx.c:275:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ucontrol->value.bytes.data,
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
   sound/soc/codecs/tscs42xx.c:275:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(ucontrol->value.bytes.data,
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
   sound/soc/codecs/tscs42xx.c:299:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&tscs42xx->coeff_ram[ctl->addr * COEFF_SIZE],
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
   sound/soc/codecs/tscs42xx.c:299:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(&tscs42xx->coeff_ram[ctl->addr * COEFF_SIZE],
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
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   sound/soc/sof/ipc3-loader.c:21:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&sdev->fw_ready.version, &v->version, sizeof(v->version));
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
   sound/soc/sof/ipc3-loader.c:21:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(&sdev->fw_ready.version, &v->version, sizeof(v->version));
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
>> sound/soc/sof/ipc3-loader.c:51:32: warning: Value stored to 'dbg_abi' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct ext_man_dbg_abi *dbg_abi =3D
                                         ^~~~~~~
   sound/soc/sof/ipc3-loader.c:51:32: note: Value stored to 'dbg_abi' durin=
g its initialization is never read
           const struct ext_man_dbg_abi *dbg_abi =3D
                                         ^~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   sound/soc/stm/stm32_sai_sub.c:277:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(uctl->value.iec958.status, sai->iec958.status, 4);
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
   sound/soc/stm/stm32_sai_sub.c:277:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(uctl->value.iec958.status, sai->iec958.status, 4);
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
   sound/soc/stm/stm32_sai_sub.c:289:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sai->iec958.status, uctl->value.iec958.status, 4);
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
   sound/soc/stm/stm32_sai_sub.c:289:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(sai->iec958.status, uctl->value.iec958.status, 4);
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
   sound/soc/stm/stm32_sai_sub.c:475:26: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           STM_SAI_IS_SUB_A(sai) ? strcat(p, "a_mclk") : strcat(p, "b_mclk"=
);
                                   ^~~~~~
   sound/soc/stm/stm32_sai_sub.c:475:26: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
           STM_SAI_IS_SUB_A(sai) ? strcat(p, "a_mclk") : strcat(p, "b_mclk"=
);
                                   ^~~~~~
   sound/soc/stm/stm32_sai_sub.c:475:48: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           STM_SAI_IS_SUB_A(sai) ? strcat(p, "a_mclk") : strcat(p, "b_mclk"=
);
                                                         ^~~~~~
   sound/soc/stm/stm32_sai_sub.c:475:48: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
           STM_SAI_IS_SUB_A(sai) ? strcat(p, "a_mclk") : strcat(p, "b_mclk"=
);
                                                         ^~~~~~
   sound/soc/stm/stm32_sai_sub.c:503:13: warning: The left operand of '&' i=
s a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           flags =3D sr & imr;
                   ~~ ^
   sound/soc/stm/stm32_sai_sub.c:497:15: note: 'sr' declared without an ini=
tial value
           unsigned int sr, imr, flags;
                        ^~
   sound/soc/stm/stm32_sai_sub.c:501:2: note: Calling 'stm32_sai_sub_reg_rd'
           stm32_sai_sub_reg_rd(sai, STM_SAI_SR_REGX, &sr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/stm/stm32_sai_sub.c:228:6: note: Assuming 'ret' is < 0
           if (ret < 0)
               ^~~~~~~
   sound/soc/stm/stm32_sai_sub.c:228:2: note: Taking true branch
           if (ret < 0)
           ^
   sound/soc/stm/stm32_sai_sub.c:229:3: note: Returning without writing to =
'*val'
                   return ret;
                   ^
   sound/soc/stm/stm32_sai_sub.c:501:2: note: Returning from 'stm32_sai_sub=
_reg_rd'

vim +/dbg_abi +51 sound/soc/sof/ipc3-loader.c

d2458baa799fff Peter Ujfalusi 2022-04-25  47  =

d2458baa799fff Peter Ujfalusi 2022-04-25  48  static int ipc3_fw_ext_man_ge=
t_dbg_abi_info(struct snd_sof_dev *sdev,
d2458baa799fff Peter Ujfalusi 2022-04-25  49  					    const struct sof_ext=
_man_elem_header *hdr)
d2458baa799fff Peter Ujfalusi 2022-04-25  50  {
d2458baa799fff Peter Ujfalusi 2022-04-25 @51  	const struct ext_man_dbg_abi=
 *dbg_abi =3D
d2458baa799fff Peter Ujfalusi 2022-04-25  52  		container_of(hdr, struct ex=
t_man_dbg_abi, hdr);
d2458baa799fff Peter Ujfalusi 2022-04-25  53  =

d2458baa799fff Peter Ujfalusi 2022-04-25  54  	if (sdev->first_boot)
d2458baa799fff Peter Ujfalusi 2022-04-25  55  		dev_dbg(sdev->dev,
d2458baa799fff Peter Ujfalusi 2022-04-25  56  			"Firmware: DBG_ABI %d:%d:%=
d\n",
d2458baa799fff Peter Ujfalusi 2022-04-25  57  			SOF_ABI_VERSION_MAJOR(dbg_=
abi->dbg_abi.abi_dbg_version),
d2458baa799fff Peter Ujfalusi 2022-04-25  58  			SOF_ABI_VERSION_MINOR(dbg_=
abi->dbg_abi.abi_dbg_version),
d2458baa799fff Peter Ujfalusi 2022-04-25  59  			SOF_ABI_VERSION_PATCH(dbg_=
abi->dbg_abi.abi_dbg_version));
d2458baa799fff Peter Ujfalusi 2022-04-25  60  =

d2458baa799fff Peter Ujfalusi 2022-04-25  61  	return 0;
d2458baa799fff Peter Ujfalusi 2022-04-25  62  }
d2458baa799fff Peter Ujfalusi 2022-04-25  63  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5469864488247230075==--


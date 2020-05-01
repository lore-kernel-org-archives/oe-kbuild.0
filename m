Content-Type: multipart/mixed; boundary="===============2771001825326995555=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [skn:smccc_v1_2_soc_id 5/5] drivers/firmware/psci/soc_id.c:43:9: sparse: sparse: string literal expected for inline asm
Date: Fri, 01 May 2020 11:01:20 +0800
Message-ID: <202005011112.bqNc9vJ3%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2771001825326995555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.=
git smccc_v1_2_soc_id
head:   115a25be0455e18591cddf3336fd6afaa904ac61
commit: 115a25be0455e18591cddf3336fd6afaa904ac61 [5/5] arm/arm64: smccc: Ad=
d ARCH_SOC_ID support
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 115a25be0455e18591cddf3336fd6afaa904ac61
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/firmware/psci/soc_id.c:43:9: sparse: sparse: string literal expe=
cted for inline asm
   drivers/firmware/psci/soc_id.c:43:9: sparse: sparse: Expected ) after asm
   drivers/firmware/psci/soc_id.c:43:9: sparse: sparse: got "n"
>> drivers/firmware/psci/soc_id.c:43:9: sparse: sparse: string literal expe=
cted for inline asm
   drivers/firmware/psci/soc_id.c:43:9: sparse: sparse: Expected ) after asm
   drivers/firmware/psci/soc_id.c:43:9: sparse: sparse: got "n"
   drivers/firmware/psci/soc_id.c:89:9: sparse: sparse: string literal expe=
cted for inline asm
   drivers/firmware/psci/soc_id.c:89:9: sparse: sparse: Expected ) after asm
   drivers/firmware/psci/soc_id.c:89:9: sparse: sparse: got "n"
   drivers/firmware/psci/soc_id.c:89:9: sparse: sparse: string literal expe=
cted for inline asm
   drivers/firmware/psci/soc_id.c:89:9: sparse: sparse: Expected ) after asm
   drivers/firmware/psci/soc_id.c:89:9: sparse: sparse: got "n"
   drivers/firmware/psci/soc_id.c:97:9: sparse: sparse: string literal expe=
cted for inline asm
   drivers/firmware/psci/soc_id.c:97:9: sparse: sparse: Expected ) after asm
   drivers/firmware/psci/soc_id.c:97:9: sparse: sparse: got "n"
   drivers/firmware/psci/soc_id.c:97:9: sparse: sparse: string literal expe=
cted for inline asm
   drivers/firmware/psci/soc_id.c:97:9: sparse: sparse: Expected ) after asm
   drivers/firmware/psci/soc_id.c:97:9: sparse: sparse: got "n"

# https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/co=
mmit/?id=3D115a25be0455e18591cddf3336fd6afaa904ac61
git remote add skn https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.h=
olla/linux.git
git remote update skn
git checkout 115a25be0455e18591cddf3336fd6afaa904ac61
vim +43 drivers/firmware/psci/soc_id.c

115a25be0455e18 Sudeep Holla 2020-04-27  33  =

115a25be0455e18 Sudeep Holla 2020-04-27  34  static int smccc_soc_id_suppor=
t_check(void)
115a25be0455e18 Sudeep Holla 2020-04-27  35  {
115a25be0455e18 Sudeep Holla 2020-04-27  36  	struct arm_smccc_res res;
115a25be0455e18 Sudeep Holla 2020-04-27  37  =

115a25be0455e18 Sudeep Holla 2020-04-27  38  	if (arm_smccc_1_1_get_conduit=
() =3D=3D SMCCC_CONDUIT_NONE) {
115a25be0455e18 Sudeep Holla 2020-04-27  39  		pr_err("%s: invalid SMCCC co=
nduit\n", __func__);
115a25be0455e18 Sudeep Holla 2020-04-27  40  		return -EOPNOTSUPP;
115a25be0455e18 Sudeep Holla 2020-04-27  41  	}
115a25be0455e18 Sudeep Holla 2020-04-27  42  =

115a25be0455e18 Sudeep Holla 2020-04-27 @43  	arm_smccc_1_1_invoke(ARM_SMCC=
C_ARCH_FEATURES_FUNC_ID,
115a25be0455e18 Sudeep Holla 2020-04-27  44  			     ARM_SMCCC_ARCH_SOC_ID,=
 &res);
115a25be0455e18 Sudeep Holla 2020-04-27  45  =

115a25be0455e18 Sudeep Holla 2020-04-27  46  	return smccc_map_error_codes(=
res.a0);
115a25be0455e18 Sudeep Holla 2020-04-27  47  }
115a25be0455e18 Sudeep Holla 2020-04-27  48  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2771001825326995555==--


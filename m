Content-Type: multipart/mixed; boundary="===============2946402822955525192=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/qcom_scm.c:181:12: warning: Redundant condition: cpus. '!cpus || (cpus && cpumask_empty(cpus))' is equivalent to '!cpus || cpumask_empty(cpus)'
Date: Wed, 16 Sep 2020 06:58:37 +0800
Message-ID: <202009160633.L0lkkCbC%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2946402822955525192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Elliot Berman <eberman@codeaurora.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fc4f28bb3daf3265d6bc5f73b497306985bb23ab
commit: 57d3b816718c1cf832e2929a754da3564c6127cc firmware: qcom_scm: Remove=
 thin wrappers
date:   8 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 8 months ago
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/firmware/qcom_scm.c:181:12: warning: Redundant condition: cpus. =
'!cpus || (cpus && cpumask_empty(cpus))' is equivalent to '!cpus || cpumask=
_empty(cpus)' [redundantCondition]
    if (!cpus || (cpus && cpumask_empty(cpus)))
              ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D57d3b816718c1cf832e2929a754da3564c6127cc
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 57d3b816718c1cf832e2929a754da3564c6127cc
vim +181 drivers/firmware/qcom_scm.c

2ce76a6ad32fa0 Lina Iyer     2015-03-02  155  =

2ce76a6ad32fa0 Lina Iyer     2015-03-02  156  /**
65f0c90b7d4685 Elliot Berman 2020-01-07  157   * qcom_scm_set_cold_boot_add=
r() - Set the cold boot address for cpus
2ce76a6ad32fa0 Lina Iyer     2015-03-02  158   * @entry: Entry point functi=
on for the cpus
2ce76a6ad32fa0 Lina Iyer     2015-03-02  159   * @cpus: The cpumask of cpus=
 that will use the entry point
2ce76a6ad32fa0 Lina Iyer     2015-03-02  160   *
65f0c90b7d4685 Elliot Berman 2020-01-07  161   * Set the cold boot address =
of the cpus. Any cpu outside the supported
65f0c90b7d4685 Elliot Berman 2020-01-07  162   * range would be removed fro=
m the cpu present mask.
2ce76a6ad32fa0 Lina Iyer     2015-03-02  163   */
65f0c90b7d4685 Elliot Berman 2020-01-07  164  int qcom_scm_set_cold_boot_ad=
dr(void *entry, const cpumask_t *cpus)
2ce76a6ad32fa0 Lina Iyer     2015-03-02  165  {
57d3b816718c1c Elliot Berman 2020-01-07  166  	int flags =3D 0;
57d3b816718c1c Elliot Berman 2020-01-07  167  	int cpu;
57d3b816718c1c Elliot Berman 2020-01-07  168  	int scm_cb_flags[] =3D {
57d3b816718c1c Elliot Berman 2020-01-07  169  		QCOM_SCM_FLAG_COLDBOOT_CPU0,
57d3b816718c1c Elliot Berman 2020-01-07  170  		QCOM_SCM_FLAG_COLDBOOT_CPU1,
57d3b816718c1c Elliot Berman 2020-01-07  171  		QCOM_SCM_FLAG_COLDBOOT_CPU2,
57d3b816718c1c Elliot Berman 2020-01-07  172  		QCOM_SCM_FLAG_COLDBOOT_CPU3,
57d3b816718c1c Elliot Berman 2020-01-07  173  	};
57d3b816718c1c Elliot Berman 2020-01-07  174  	struct qcom_scm_desc desc =
=3D {
57d3b816718c1c Elliot Berman 2020-01-07  175  		.svc =3D QCOM_SCM_SVC_BOOT,
57d3b816718c1c Elliot Berman 2020-01-07  176  		.cmd =3D QCOM_SCM_BOOT_SET_=
ADDR,
57d3b816718c1c Elliot Berman 2020-01-07  177  		.arginfo =3D QCOM_SCM_ARGS(=
2),
57d3b816718c1c Elliot Berman 2020-01-07  178  		.owner =3D ARM_SMCCC_OWNER_=
SIP,
57d3b816718c1c Elliot Berman 2020-01-07  179  	};
57d3b816718c1c Elliot Berman 2020-01-07  180  =

57d3b816718c1c Elliot Berman 2020-01-07 @181  	if (!cpus || (cpus && cpumas=
k_empty(cpus)))
57d3b816718c1c Elliot Berman 2020-01-07  182  		return -EINVAL;
57d3b816718c1c Elliot Berman 2020-01-07  183  =

57d3b816718c1c Elliot Berman 2020-01-07  184  	for_each_cpu(cpu, cpus) {
57d3b816718c1c Elliot Berman 2020-01-07  185  		if (cpu < ARRAY_SIZE(scm_cb=
_flags))
57d3b816718c1c Elliot Berman 2020-01-07  186  			flags |=3D scm_cb_flags[cp=
u];
57d3b816718c1c Elliot Berman 2020-01-07  187  		else
57d3b816718c1c Elliot Berman 2020-01-07  188  			set_cpu_present(cpu, false=
);
57d3b816718c1c Elliot Berman 2020-01-07  189  	}
57d3b816718c1c Elliot Berman 2020-01-07  190  =

57d3b816718c1c Elliot Berman 2020-01-07  191  	desc.args[0] =3D flags;
57d3b816718c1c Elliot Berman 2020-01-07  192  	desc.args[1] =3D virt_to_phy=
s(entry);
57d3b816718c1c Elliot Berman 2020-01-07  193  =

57d3b816718c1c Elliot Berman 2020-01-07  194  	return qcom_scm_call_atomic(=
__scm ? __scm->dev : NULL, &desc, NULL);
2ce76a6ad32fa0 Lina Iyer     2015-03-02  195  }
65f0c90b7d4685 Elliot Berman 2020-01-07  196  EXPORT_SYMBOL(qcom_scm_set_co=
ld_boot_addr);
767b0235dd4765 Lina Iyer     2015-03-02  197  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2946402822955525192==--


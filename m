Content-Type: multipart/mixed; boundary="===============4459912564691997831=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 2/9] mfd: qcom-spmi-pmic: expose the PMIC revid information to clients
Date: Fri, 18 Feb 2022 04:29:00 +0800
Message-ID: <202202180412.YwXgb5WR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4459912564691997831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220216134920.239989-3-caleb.connolly@linaro.org>
References: <20220216134920.239989-3-caleb.connolly@linaro.org>
TO: Caleb Connolly <caleb.connolly@linaro.org>
TO: caleb.connolly(a)linaro.org
TO: Jonathan Cameron <jic23@kernel.org>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Rob Herring <robh+dt@kernel.org>
TO: Andy Gross <agross@kernel.org>
TO: Bjorn Andersson <bjorn.andersson@linaro.org>
TO: Lee Jones <lee.jones@linaro.org>
TO: Stephen Boyd <sboyd@kernel.org>
TO: linux-iio(a)vger.kernel.org
TO: devicetree(a)vger.kernel.org
TO: linux-arm-msm(a)vger.kernel.org
CC: sumit.semwal(a)linaro.org
CC: amit.pundir(a)linaro.org
CC: john.stultz(a)linaro.org

Hi Caleb,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on jic23-iio/togreg lee-mfd/for-mfd-next linus/mas=
ter v5.17-rc4 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Caleb-Connolly/iio-adc-int=
roduce-Qualcomm-SPMI-Round-Robin-ADC/20220216-215127
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm-randconfig-m031-20220217 (https://download.01.org/0day-ci/archi=
ve/20220218/202202180412.YwXgb5WR-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mfd/qcom-spmi-pmic.c:104 qcom_pmic_get() error: uninitialized symbo=
l 'other_usid'.

vim +/other_usid +104 drivers/mfd/qcom-spmi-pmic.c

dc716bbf1d4875 Ivan T. Ivanov 2015-03-17   58  =

0e7c7a6e235e61 Caleb Connolly 2022-02-16   59  /**
0e7c7a6e235e61 Caleb Connolly 2022-02-16   60   * @brief Get a pointer to t=
he base PMIC device
0e7c7a6e235e61 Caleb Connolly 2022-02-16   61   *
0e7c7a6e235e61 Caleb Connolly 2022-02-16   62   * @param dev the pmic funct=
ion device
0e7c7a6e235e61 Caleb Connolly 2022-02-16   63   * @return const struct qcom=
_spmi_pmic*
0e7c7a6e235e61 Caleb Connolly 2022-02-16   64   *
0e7c7a6e235e61 Caleb Connolly 2022-02-16   65   * A PMIC can be represented=
 by multiple SPMI devices, but
0e7c7a6e235e61 Caleb Connolly 2022-02-16   66   * only the base PMIC device=
 will contain a reference to
0e7c7a6e235e61 Caleb Connolly 2022-02-16   67   * the revision information.
0e7c7a6e235e61 Caleb Connolly 2022-02-16   68   *
0e7c7a6e235e61 Caleb Connolly 2022-02-16   69   * This function takes a poi=
nter to a function device and
0e7c7a6e235e61 Caleb Connolly 2022-02-16   70   * returns a pointer to the =
base PMIC device.
0e7c7a6e235e61 Caleb Connolly 2022-02-16   71   */
0e7c7a6e235e61 Caleb Connolly 2022-02-16   72  const struct qcom_spmi_pmic =
*qcom_pmic_get(struct device *dev)
0e7c7a6e235e61 Caleb Connolly 2022-02-16   73  {
0e7c7a6e235e61 Caleb Connolly 2022-02-16   74  	struct spmi_device *sdev;
0e7c7a6e235e61 Caleb Connolly 2022-02-16   75  	struct device_node *spmi_bu=
s;
0e7c7a6e235e61 Caleb Connolly 2022-02-16   76  	struct device_node *other_u=
sid;
0e7c7a6e235e61 Caleb Connolly 2022-02-16   77  	int function_parent_usid, r=
et;
0e7c7a6e235e61 Caleb Connolly 2022-02-16   78  	u32 reg[2];
0e7c7a6e235e61 Caleb Connolly 2022-02-16   79  =

0e7c7a6e235e61 Caleb Connolly 2022-02-16   80  	if (!of_match_device(pmic_s=
pmi_id_table, dev->parent))
0e7c7a6e235e61 Caleb Connolly 2022-02-16   81  		return ERR_PTR(-EINVAL);
0e7c7a6e235e61 Caleb Connolly 2022-02-16   82  =

0e7c7a6e235e61 Caleb Connolly 2022-02-16   83  	sdev =3D to_spmi_device(dev=
->parent);
0e7c7a6e235e61 Caleb Connolly 2022-02-16   84  	if (!sdev)
0e7c7a6e235e61 Caleb Connolly 2022-02-16   85  		return ERR_PTR(-EINVAL);
0e7c7a6e235e61 Caleb Connolly 2022-02-16   86  =

0e7c7a6e235e61 Caleb Connolly 2022-02-16   87  	/*
0e7c7a6e235e61 Caleb Connolly 2022-02-16   88  	 * Quick return if the func=
tion device is already in the right
0e7c7a6e235e61 Caleb Connolly 2022-02-16   89  	 * USID
0e7c7a6e235e61 Caleb Connolly 2022-02-16   90  	 */
0e7c7a6e235e61 Caleb Connolly 2022-02-16   91  	if (sdev->usid % 2 =3D=3D 0)
0e7c7a6e235e61 Caleb Connolly 2022-02-16   92  		return spmi_device_get_drv=
data(sdev);
0e7c7a6e235e61 Caleb Connolly 2022-02-16   93  =

0e7c7a6e235e61 Caleb Connolly 2022-02-16   94  	function_parent_usid =3D sd=
ev->usid;
0e7c7a6e235e61 Caleb Connolly 2022-02-16   95  =

0e7c7a6e235e61 Caleb Connolly 2022-02-16   96  	/*
0e7c7a6e235e61 Caleb Connolly 2022-02-16   97  	 * Walk through the list of=
 PMICs until we find the sibling USID.
0e7c7a6e235e61 Caleb Connolly 2022-02-16   98  	 * The goal is the find to =
previous sibling. Assuming there is no
0e7c7a6e235e61 Caleb Connolly 2022-02-16   99  	 * PMIC with more than 2 US=
IDs. We know that function_parent_usid
0e7c7a6e235e61 Caleb Connolly 2022-02-16  100  	 * is one greater than the =
base USID.
0e7c7a6e235e61 Caleb Connolly 2022-02-16  101  	 */
0e7c7a6e235e61 Caleb Connolly 2022-02-16  102  	spmi_bus =3D of_get_parent(=
sdev->dev.parent->of_node);
0e7c7a6e235e61 Caleb Connolly 2022-02-16  103  	do {
0e7c7a6e235e61 Caleb Connolly 2022-02-16 @104  		other_usid =3D of_get_next=
_child(spmi_bus, other_usid);
0e7c7a6e235e61 Caleb Connolly 2022-02-16  105  		ret =3D of_property_read_u=
32_array(other_usid, "reg", reg, 2);
0e7c7a6e235e61 Caleb Connolly 2022-02-16  106  		if (ret)
0e7c7a6e235e61 Caleb Connolly 2022-02-16  107  			return ERR_PTR(ret);
0e7c7a6e235e61 Caleb Connolly 2022-02-16  108  		sdev =3D spmi_device_from_=
of(other_usid);
0e7c7a6e235e61 Caleb Connolly 2022-02-16  109  		if (sdev =3D=3D NULL) {
0e7c7a6e235e61 Caleb Connolly 2022-02-16  110  			/*
0e7c7a6e235e61 Caleb Connolly 2022-02-16  111  			 * If the base USID for t=
his PMIC hasn't probed yet
0e7c7a6e235e61 Caleb Connolly 2022-02-16  112  			 * but the secondary USID=
 has, then we need to defer
0e7c7a6e235e61 Caleb Connolly 2022-02-16  113  			 * the function driver so=
 that it will attempt to
0e7c7a6e235e61 Caleb Connolly 2022-02-16  114  			 * probe again when the b=
ase USID is ready.
0e7c7a6e235e61 Caleb Connolly 2022-02-16  115  			 */
0e7c7a6e235e61 Caleb Connolly 2022-02-16  116  			if (reg[0] =3D=3D functio=
n_parent_usid - 1)
0e7c7a6e235e61 Caleb Connolly 2022-02-16  117  				return ERR_PTR(-EPROBE_D=
EFER);
0e7c7a6e235e61 Caleb Connolly 2022-02-16  118  =

0e7c7a6e235e61 Caleb Connolly 2022-02-16  119  			continue;
0e7c7a6e235e61 Caleb Connolly 2022-02-16  120  		}
0e7c7a6e235e61 Caleb Connolly 2022-02-16  121  =

0e7c7a6e235e61 Caleb Connolly 2022-02-16  122  		if (reg[0] =3D=3D function=
_parent_usid - 1)
0e7c7a6e235e61 Caleb Connolly 2022-02-16  123  			return spmi_device_get_dr=
vdata(sdev);
0e7c7a6e235e61 Caleb Connolly 2022-02-16  124  	} while (other_usid->siblin=
g);
0e7c7a6e235e61 Caleb Connolly 2022-02-16  125  =

0e7c7a6e235e61 Caleb Connolly 2022-02-16  126  	return ERR_PTR(-ENODATA);
0e7c7a6e235e61 Caleb Connolly 2022-02-16  127  }
0e7c7a6e235e61 Caleb Connolly 2022-02-16  128  EXPORT_SYMBOL(qcom_pmic_get);
0e7c7a6e235e61 Caleb Connolly 2022-02-16  129  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4459912564691997831==--


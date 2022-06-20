Content-Type: multipart/mixed; boundary="===============5364376709504414440=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: qcom: common: use parent_hws in _qcom_cc_register_board_clk()
Date: Tue, 21 Jun 2022 03:07:12 +0800
Message-ID: <202206210257.lD0x1WPz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5364376709504414440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220620080117.1571807-1-dmitry.baryshkov@linaro.org>
References: <20220620080117.1571807-1-dmitry.baryshkov@linaro.org>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
TO: Andy Gross <agross@kernel.org>
TO: Bjorn Andersson <bjorn.andersson@linaro.org>
TO: Stephen Boyd <swboyd@chromium.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Taniya Das <quic_tdas@quicinc.com>
CC: linux-arm-msm(a)vger.kernel.org
CC: linux-clk(a)vger.kernel.org

Hi Dmitry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/clk=
-qcom-common-use-parent_hws-in-_qcom_cc_register_board_clk/20220620-160242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: parisc-randconfig-m031-20220619 (https://download.01.org/0day-ci/ar=
chive/20220621/202206210257.lD0x1WPz-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/qcom/common.c:172 _qcom_cc_register_board_clk() error: uninitia=
lized symbol 'fixed'.

vim +/fixed +172 drivers/clk/qcom/common.c

94c51f4073260e Stephen Boyd     2015-10-07  123  =

ee15faffef1130 Stephen Boyd     2015-10-26  124  /*
ee15faffef1130 Stephen Boyd     2015-10-26  125   * Backwards compatibility=
 with old DTs. Register a pass-through factor 1/1
ad61dd303a0f24 Stephen Boyd     2017-05-08  126   * clock to translate 'pat=
h' clk into 'name' clk and register the 'path'
ee15faffef1130 Stephen Boyd     2015-10-26  127   * clk as a fixed rate clo=
ck if it isn't present.
ee15faffef1130 Stephen Boyd     2015-10-26  128   */
ee15faffef1130 Stephen Boyd     2015-10-26  129  static int _qcom_cc_regist=
er_board_clk(struct device *dev, const char *path,
ee15faffef1130 Stephen Boyd     2015-10-26  130  				       const char *nam=
e, unsigned long rate,
ee15faffef1130 Stephen Boyd     2015-10-26  131  				       bool add_factor)
ee15faffef1130 Stephen Boyd     2015-10-26  132  {
ee15faffef1130 Stephen Boyd     2015-10-26  133  	struct device_node *node =
=3D NULL;
ee15faffef1130 Stephen Boyd     2015-10-26  134  	struct device_node *clock=
s_node;
ee15faffef1130 Stephen Boyd     2015-10-26  135  	struct clk_fixed_factor *=
factor;
ee15faffef1130 Stephen Boyd     2015-10-26  136  	struct clk_fixed_rate *fi=
xed;
ee15faffef1130 Stephen Boyd     2015-10-26  137  	struct clk_init_data init=
_data =3D { };
120c1552839036 Stephen Boyd     2016-08-16  138  	int ret;
ee15faffef1130 Stephen Boyd     2015-10-26  139  =

ee15faffef1130 Stephen Boyd     2015-10-26  140  	clocks_node =3D of_find_n=
ode_by_path("/clocks");
43a51019cc8ff1 Johan Hovold     2017-11-11  141  	if (clocks_node) {
43a51019cc8ff1 Johan Hovold     2017-11-11  142  		node =3D of_get_child_by=
_name(clocks_node, path);
43a51019cc8ff1 Johan Hovold     2017-11-11  143  		of_node_put(clocks_node);
43a51019cc8ff1 Johan Hovold     2017-11-11  144  	}
ee15faffef1130 Stephen Boyd     2015-10-26  145  =

ee15faffef1130 Stephen Boyd     2015-10-26  146  	if (!node) {
ee15faffef1130 Stephen Boyd     2015-10-26  147  		fixed =3D devm_kzalloc(d=
ev, sizeof(*fixed), GFP_KERNEL);
ee15faffef1130 Stephen Boyd     2015-10-26  148  		if (!fixed)
ee15faffef1130 Stephen Boyd     2015-10-26  149  			return -EINVAL;
ee15faffef1130 Stephen Boyd     2015-10-26  150  =

ee15faffef1130 Stephen Boyd     2015-10-26  151  		fixed->fixed_rate =3D ra=
te;
ee15faffef1130 Stephen Boyd     2015-10-26  152  		fixed->hw.init =3D &init=
_data;
ee15faffef1130 Stephen Boyd     2015-10-26  153  =

ee15faffef1130 Stephen Boyd     2015-10-26  154  		init_data.name =3D path;
ee15faffef1130 Stephen Boyd     2015-10-26  155  		init_data.ops =3D &clk_f=
ixed_rate_ops;
ee15faffef1130 Stephen Boyd     2015-10-26  156  =

120c1552839036 Stephen Boyd     2016-08-16  157  		ret =3D devm_clk_hw_regi=
ster(dev, &fixed->hw);
120c1552839036 Stephen Boyd     2016-08-16  158  		if (ret)
120c1552839036 Stephen Boyd     2016-08-16  159  			return ret;
ee15faffef1130 Stephen Boyd     2015-10-26  160  	}
ee15faffef1130 Stephen Boyd     2015-10-26  161  	of_node_put(node);
ee15faffef1130 Stephen Boyd     2015-10-26  162  =

ee15faffef1130 Stephen Boyd     2015-10-26  163  	if (add_factor) {
ee15faffef1130 Stephen Boyd     2015-10-26  164  		factor =3D devm_kzalloc(=
dev, sizeof(*factor), GFP_KERNEL);
ee15faffef1130 Stephen Boyd     2015-10-26  165  		if (!factor)
ee15faffef1130 Stephen Boyd     2015-10-26  166  			return -EINVAL;
ee15faffef1130 Stephen Boyd     2015-10-26  167  =

ee15faffef1130 Stephen Boyd     2015-10-26  168  		factor->mult =3D factor-=
>div =3D 1;
ee15faffef1130 Stephen Boyd     2015-10-26  169  		factor->hw.init =3D &ini=
t_data;
ee15faffef1130 Stephen Boyd     2015-10-26  170  =

ee15faffef1130 Stephen Boyd     2015-10-26  171  		init_data.name =3D name;
daa853a735065a Dmitry Baryshkov 2022-06-20 @172  		init_data.parent_hws =3D=
 (const struct clk_hw*[]){ &fixed->hw };
ee15faffef1130 Stephen Boyd     2015-10-26  173  		init_data.num_parents =
=3D 1;
ee15faffef1130 Stephen Boyd     2015-10-26  174  		init_data.flags =3D 0;
ee15faffef1130 Stephen Boyd     2015-10-26  175  		init_data.ops =3D &clk_f=
ixed_factor_ops;
ee15faffef1130 Stephen Boyd     2015-10-26  176  =

120c1552839036 Stephen Boyd     2016-08-16  177  		ret =3D devm_clk_hw_regi=
ster(dev, &factor->hw);
120c1552839036 Stephen Boyd     2016-08-16  178  		if (ret)
120c1552839036 Stephen Boyd     2016-08-16  179  			return ret;
ee15faffef1130 Stephen Boyd     2015-10-26  180  	}
ee15faffef1130 Stephen Boyd     2015-10-26  181  =

ee15faffef1130 Stephen Boyd     2015-10-26  182  	return 0;
ee15faffef1130 Stephen Boyd     2015-10-26  183  }
ee15faffef1130 Stephen Boyd     2015-10-26  184  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5364376709504414440==--


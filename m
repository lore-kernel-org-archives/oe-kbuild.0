Content-Type: multipart/mixed; boundary="===============2990263611209628060=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: fixed-rate: Remove redundant if statement
Date: Sat, 14 May 2022 06:00:41 +0800
Message-ID: <202205140532.i7VWeIt3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2990263611209628060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220509092102.140520-1-lizhengyu3@huawei.com>
References: <20220509092102.140520-1-lizhengyu3@huawei.com>
TO: Li Zhengyu <lizhengyu3@huawei.com>
TO: sboyd(a)kernel.org
CC: linux-clk(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: manivannan.sadhasivam(a)linaro.org
CC: mturquette(a)baylibre.com

Hi Li,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on v5.18-rc6 next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Zhengyu/clk-fixed=
-rate-Remove-redundant-if-statement/20220509-173653
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: nios2-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout bceb45c21dace95f9ebd25779111c1e81f9c758e
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/clk-fixed-rate.c:89:7: warning: Redundant initialization for=
 'ret'. The initialized value is overwritten before it is read. [redundantI=
nitialization]
     ret =3D clk_hw_register(dev, hw);
         ^
   drivers/clk/clk-fixed-rate.c:62:10: note: ret is initialized
    int ret =3D -EINVAL;
            ^
   drivers/clk/clk-fixed-rate.c:89:7: note: ret is overwritten
     ret =3D clk_hw_register(dev, hw);
         ^

vim +/ret +89 drivers/clk/clk-fixed-rate.c

9d9f78ed9af0e46 Mike Turquette        2012-03-15   51  =

2d34f09e79c9e96 Stephen Boyd          2019-08-30   52  struct clk_hw *__clk=
_hw_register_fixed_rate(struct device *dev,
2d34f09e79c9e96 Stephen Boyd          2019-08-30   53  		struct device_node=
 *np, const char *name,
2d34f09e79c9e96 Stephen Boyd          2019-08-30   54  		const char *parent=
_name, const struct clk_hw *parent_hw,
2d34f09e79c9e96 Stephen Boyd          2019-08-30   55  		const struct clk_p=
arent_data *parent_data, unsigned long flags,
2d34f09e79c9e96 Stephen Boyd          2019-08-30   56  		unsigned long fixe=
d_rate, unsigned long fixed_accuracy,
2d34f09e79c9e96 Stephen Boyd          2019-08-30   57  		unsigned long clk_=
fixed_flags)
9d9f78ed9af0e46 Mike Turquette        2012-03-15   58  {
9d9f78ed9af0e46 Mike Turquette        2012-03-15   59  	struct clk_fixed_ra=
te *fixed;
26ef56be9e0944a Stephen Boyd          2016-02-07   60  	struct clk_hw *hw;
cc819cf8d4760fa Manivannan Sadhasivam 2019-11-15   61  	struct clk_init_dat=
a init =3D {};
2d34f09e79c9e96 Stephen Boyd          2019-08-30   62  	int ret =3D -EINVAL;
9d9f78ed9af0e46 Mike Turquette        2012-03-15   63  =

27d545915fd49cb Mike Turquette        2012-03-26   64  	/* allocate fixed-r=
ate clock */
d122db7e8666924 Stephen Boyd          2015-05-14   65  	fixed =3D kzalloc(s=
izeof(*fixed), GFP_KERNEL);
d122db7e8666924 Stephen Boyd          2015-05-14   66  	if (!fixed)
9d9f78ed9af0e46 Mike Turquette        2012-03-15   67  		return ERR_PTR(-EN=
OMEM);
9d9f78ed9af0e46 Mike Turquette        2012-03-15   68  =

0197b3ea0f66cd2 Saravana Kannan       2012-04-25   69  	init.name =3D name;
0197b3ea0f66cd2 Saravana Kannan       2012-04-25   70  	init.ops =3D &clk_f=
ixed_rate_ops;
90b6c5c73c6904a Stephen Boyd          2019-04-25   71  	init.flags =3D flag=
s;
2d34f09e79c9e96 Stephen Boyd          2019-08-30   72  	init.parent_names =
=3D parent_name ? &parent_name : NULL;
2d34f09e79c9e96 Stephen Boyd          2019-08-30   73  	init.parent_hws =3D=
 parent_hw ? &parent_hw : NULL;
2d34f09e79c9e96 Stephen Boyd          2019-08-30   74  	init.parent_data =
=3D parent_data;
2d34f09e79c9e96 Stephen Boyd          2019-08-30   75  	if (parent_name || =
parent_hw || parent_data)
2d34f09e79c9e96 Stephen Boyd          2019-08-30   76  		init.num_parents =
=3D 1;
2d34f09e79c9e96 Stephen Boyd          2019-08-30   77  	else
2d34f09e79c9e96 Stephen Boyd          2019-08-30   78  		init.num_parents =
=3D 0;
0197b3ea0f66cd2 Saravana Kannan       2012-04-25   79  =

9d9f78ed9af0e46 Mike Turquette        2012-03-15   80  	/* struct clk_fixed=
_rate assignments */
2d34f09e79c9e96 Stephen Boyd          2019-08-30   81  	fixed->flags =3D cl=
k_fixed_flags;
9d9f78ed9af0e46 Mike Turquette        2012-03-15   82  	fixed->fixed_rate =
=3D fixed_rate;
0903ea60173fab2 Boris Brezillon       2013-12-21   83  	fixed->fixed_accura=
cy =3D fixed_accuracy;
0197b3ea0f66cd2 Saravana Kannan       2012-04-25   84  	fixed->hw.init =3D =
&init;
9d9f78ed9af0e46 Mike Turquette        2012-03-15   85  =

27d545915fd49cb Mike Turquette        2012-03-26   86  	/* register the clo=
ck */
26ef56be9e0944a Stephen Boyd          2016-02-07   87  	hw =3D &fixed->hw;
2d34f09e79c9e96 Stephen Boyd          2019-08-30   88  	if (dev || !np)
26ef56be9e0944a Stephen Boyd          2016-02-07  @89  		ret =3D clk_hw_reg=
ister(dev, hw);
bceb45c21dace95 Li Zhengyu            2022-05-09   90  	else
2d34f09e79c9e96 Stephen Boyd          2019-08-30   91  		ret =3D of_clk_hw_=
register(np, hw);
26ef56be9e0944a Stephen Boyd          2016-02-07   92  	if (ret) {
27d545915fd49cb Mike Turquette        2012-03-26   93  		kfree(fixed);
26ef56be9e0944a Stephen Boyd          2016-02-07   94  		hw =3D ERR_PTR(ret=
);
26ef56be9e0944a Stephen Boyd          2016-02-07   95  	}
26ef56be9e0944a Stephen Boyd          2016-02-07   96  =

26ef56be9e0944a Stephen Boyd          2016-02-07   97  	return hw;
26ef56be9e0944a Stephen Boyd          2016-02-07   98  }
2d34f09e79c9e96 Stephen Boyd          2019-08-30   99  EXPORT_SYMBOL_GPL(__=
clk_hw_register_fixed_rate);
26ef56be9e0944a Stephen Boyd          2016-02-07  100  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2990263611209628060==--


Content-Type: multipart/mixed; boundary="===============1400183770742443414=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RESEND v10 7/7] clk: baikal-t1: Convert to platform device driver
Date: Thu, 01 Sep 2022 07:35:26 +0800
Message-ID: <202209010719.UobFpx0N-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1400183770742443414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/c=
lk/baikal-t1/clk-ccu-div.c:354:42: warning: Boolean result is used in bitwi=
se operation. Clarify expression with parentheses. [clarifyCondition]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220822182934.23734-8-Sergey.Semin@baikalelectronics.ru>
References: <20220822182934.23734-8-Sergey.Semin@baikalelectronics.ru>
TO: Serge Semin <Sergey.Semin@baikalelectronics.ru>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
CC: Serge Semin <Sergey.Semin@baikalelectronics.ru>
CC: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
CC: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
CC: Philipp Zabel <p.zabel@pengutronix.de>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: linux-clk(a)vger.kernel.org
CC: linux-mips(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Serge,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on pza/reset/next linus/master v6.0-rc3 next-20220=
831]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/clk-rese=
ts-baikal-t1-Add-DDR-PCIe-resets-and-xGMAC-SATA-fixes/20220823-023308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 8adbd3c7fa1d8cf71c65ccbd315727a3cebf67e4
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/baikal-t1/clk-ccu-div.c:354:42: warning: Boolean result is u=
sed in bitwise operation. Clarify expression with parentheses. [clarifyCond=
ition]
     if (!!(info->features & CCU_DIV_BASIC) ^ defer) {
                                            ^
   drivers/clk/baikal-t1/clk-ccu-div.c:397:57: warning: Boolean result is u=
sed in bitwise operation. Clarify expression with parentheses. [clarifyCond=
ition]
     if (!!(data->divs_info[idx].features & CCU_DIV_BASIC) ^ defer)
                                                           ^
   drivers/clk/baikal-t1/clk-ccu-div.c:412:57: warning: Boolean result is u=
sed in bitwise operation. Clarify expression with parentheses. [clarifyCond=
ition]
     if (!!(data->divs_info[idx].features & CCU_DIV_BASIC) ^ defer)
                                                           ^

vim +354 drivers/clk/baikal-t1/clk-ccu-div.c

353afa3a8d2ef4 Serge Semin 2020-05-27  345  =

8adbd3c7fa1d8c Serge Semin 2022-08-22  346  static int ccu_div_clk_register=
(struct ccu_div_data *data, bool defer)
353afa3a8d2ef4 Serge Semin 2020-05-27  347  {
353afa3a8d2ef4 Serge Semin 2020-05-27  348  	int idx, ret;
353afa3a8d2ef4 Serge Semin 2020-05-27  349  =

353afa3a8d2ef4 Serge Semin 2020-05-27  350  	for (idx =3D 0; idx < data->di=
vs_num; ++idx) {
353afa3a8d2ef4 Serge Semin 2020-05-27  351  		const struct ccu_div_info *in=
fo =3D &data->divs_info[idx];
353afa3a8d2ef4 Serge Semin 2020-05-27  352  		struct ccu_div_init_data init=
 =3D {0};
353afa3a8d2ef4 Serge Semin 2020-05-27  353  =

8adbd3c7fa1d8c Serge Semin 2022-08-22 @354  		if (!!(info->features & CCU_D=
IV_BASIC) ^ defer) {
8adbd3c7fa1d8c Serge Semin 2022-08-22  355  			if (!data->divs[idx])
8adbd3c7fa1d8c Serge Semin 2022-08-22  356  				data->divs[idx] =3D ERR_PTR=
(-EPROBE_DEFER);
8adbd3c7fa1d8c Serge Semin 2022-08-22  357  =

8adbd3c7fa1d8c Serge Semin 2022-08-22  358  			continue;
8adbd3c7fa1d8c Serge Semin 2022-08-22  359  		}
8adbd3c7fa1d8c Serge Semin 2022-08-22  360  =

353afa3a8d2ef4 Serge Semin 2020-05-27  361  		init.id =3D info->id;
353afa3a8d2ef4 Serge Semin 2020-05-27  362  		init.name =3D info->name;
353afa3a8d2ef4 Serge Semin 2020-05-27  363  		init.parent_name =3D info->pa=
rent_name;
353afa3a8d2ef4 Serge Semin 2020-05-27  364  		init.np =3D data->np;
353afa3a8d2ef4 Serge Semin 2020-05-27  365  		init.type =3D info->type;
353afa3a8d2ef4 Serge Semin 2020-05-27  366  		init.flags =3D info->flags;
353afa3a8d2ef4 Serge Semin 2020-05-27  367  		init.features =3D info->featu=
res;
353afa3a8d2ef4 Serge Semin 2020-05-27  368  =

353afa3a8d2ef4 Serge Semin 2020-05-27  369  		if (init.type =3D=3D CCU_DIV_=
VAR) {
353afa3a8d2ef4 Serge Semin 2020-05-27  370  			init.base =3D info->base;
353afa3a8d2ef4 Serge Semin 2020-05-27  371  			init.sys_regs =3D data->sys_=
regs;
353afa3a8d2ef4 Serge Semin 2020-05-27  372  			init.width =3D info->width;
353afa3a8d2ef4 Serge Semin 2020-05-27  373  		} else if (init.type =3D=3D C=
CU_DIV_GATE) {
353afa3a8d2ef4 Serge Semin 2020-05-27  374  			init.base =3D info->base;
353afa3a8d2ef4 Serge Semin 2020-05-27  375  			init.sys_regs =3D data->sys_=
regs;
353afa3a8d2ef4 Serge Semin 2020-05-27  376  			init.divider =3D info->divid=
er;
989712dc656f8e Serge Semin 2022-08-22  377  		} else if (init.type =3D=3D C=
CU_DIV_BUF) {
989712dc656f8e Serge Semin 2022-08-22  378  			init.base =3D info->base;
989712dc656f8e Serge Semin 2022-08-22  379  			init.sys_regs =3D data->sys_=
regs;
353afa3a8d2ef4 Serge Semin 2020-05-27  380  		} else {
353afa3a8d2ef4 Serge Semin 2020-05-27  381  			init.divider =3D info->divid=
er;
353afa3a8d2ef4 Serge Semin 2020-05-27  382  		}
353afa3a8d2ef4 Serge Semin 2020-05-27  383  =

353afa3a8d2ef4 Serge Semin 2020-05-27  384  		data->divs[idx] =3D ccu_div_h=
w_register(&init);
353afa3a8d2ef4 Serge Semin 2020-05-27  385  		if (IS_ERR(data->divs[idx])) {
353afa3a8d2ef4 Serge Semin 2020-05-27  386  			ret =3D PTR_ERR(data->divs[i=
dx]);
353afa3a8d2ef4 Serge Semin 2020-05-27  387  			pr_err("Couldn't register di=
vider '%s' hw\n",
353afa3a8d2ef4 Serge Semin 2020-05-27  388  				init.name);
353afa3a8d2ef4 Serge Semin 2020-05-27  389  			goto err_hw_unregister;
353afa3a8d2ef4 Serge Semin 2020-05-27  390  		}
353afa3a8d2ef4 Serge Semin 2020-05-27  391  	}
353afa3a8d2ef4 Serge Semin 2020-05-27  392  =

353afa3a8d2ef4 Serge Semin 2020-05-27  393  	return 0;
353afa3a8d2ef4 Serge Semin 2020-05-27  394  =

353afa3a8d2ef4 Serge Semin 2020-05-27  395  err_hw_unregister:
8adbd3c7fa1d8c Serge Semin 2022-08-22  396  	for (--idx; idx >=3D 0; --idx)=
 {
8adbd3c7fa1d8c Serge Semin 2022-08-22  397  		if (!!(data->divs_info[idx].f=
eatures & CCU_DIV_BASIC) ^ defer)
8adbd3c7fa1d8c Serge Semin 2022-08-22  398  			continue;
8adbd3c7fa1d8c Serge Semin 2022-08-22  399  =

353afa3a8d2ef4 Serge Semin 2020-05-27  400  		ccu_div_hw_unregister(data->d=
ivs[idx]);
8adbd3c7fa1d8c Serge Semin 2022-08-22  401  	}
353afa3a8d2ef4 Serge Semin 2020-05-27  402  =

353afa3a8d2ef4 Serge Semin 2020-05-27  403  	return ret;
353afa3a8d2ef4 Serge Semin 2020-05-27  404  }
353afa3a8d2ef4 Serge Semin 2020-05-27  405  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1400183770742443414==--


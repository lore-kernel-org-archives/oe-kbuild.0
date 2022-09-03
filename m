Content-Type: multipart/mixed; boundary="===============0732680754474431253=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/memory/ti-emif-pm.c:278:26: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 04 Sep 2022 00:36:57 +0800
Message-ID: <202209040035.ykR1Vfom-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0732680754474431253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
emory/ti-emif-pm.c:278:26: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d895ec7938c431fe61a731939da76a6461bc6133
commit: 8e6a257a173378d0fb42d64865545286f1f84ef6 memory: ti-emif-pm: simpli=
fy platform_get_resource()
date:   4 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220831 (https://download.01.org/0day-ci/archi=
ve/20220904/202209040035.ykR1Vfom-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8e6a257a173378d0fb42d64865545286f1f84ef6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8e6a257a173378d0fb42d64865545286f1f84ef6
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/memory/ti-emif-pm.c: In function 'ti_emif_probe':
>> drivers/memory/ti-emif-pm.c:278:26: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     278 |         struct resource *res;
         |                          ^~~
     'ti_emif_probe': event 1
       |
       |  278 |         struct resource *res;
       |      |                          ^~~
       |      |                          |
       |      |                          (1) use of uninitialized value '<u=
nknown>' here
       |

vim +278 drivers/memory/ti-emif-pm.c

38853979e6dce84 Dave Gerlach        2018-06-26  274  =

8428e5ad750d482 Dave Gerlach        2015-06-17  275  static int ti_emif_pro=
be(struct platform_device *pdev)
8428e5ad750d482 Dave Gerlach        2015-06-17  276  {
8428e5ad750d482 Dave Gerlach        2015-06-17  277  	int ret;
8428e5ad750d482 Dave Gerlach        2015-06-17 @278  	struct resource *res;
8428e5ad750d482 Dave Gerlach        2015-06-17  279  	struct device *dev =
=3D &pdev->dev;
8428e5ad750d482 Dave Gerlach        2015-06-17  280  	const struct of_devic=
e_id *match;
8428e5ad750d482 Dave Gerlach        2015-06-17  281  	struct ti_emif_data *=
emif_data;
8428e5ad750d482 Dave Gerlach        2015-06-17  282  =

8428e5ad750d482 Dave Gerlach        2015-06-17  283  	emif_data =3D devm_kz=
alloc(dev, sizeof(*emif_data), GFP_KERNEL);
8428e5ad750d482 Dave Gerlach        2015-06-17  284  	if (!emif_data)
8428e5ad750d482 Dave Gerlach        2015-06-17  285  		return -ENOMEM;
8428e5ad750d482 Dave Gerlach        2015-06-17  286  =

8428e5ad750d482 Dave Gerlach        2015-06-17  287  	match =3D of_match_de=
vice(ti_emif_of_match, &pdev->dev);
8428e5ad750d482 Dave Gerlach        2015-06-17  288  	if (!match)
8428e5ad750d482 Dave Gerlach        2015-06-17  289  		return -ENODEV;
8428e5ad750d482 Dave Gerlach        2015-06-17  290  =

8428e5ad750d482 Dave Gerlach        2015-06-17  291  	emif_data->pm_data.ti=
_emif_sram_config =3D (unsigned long)match->data;
8428e5ad750d482 Dave Gerlach        2015-06-17  292  =

8e6a257a173378d Krzysztof Kozlowski 2022-04-19  293  	emif_data->pm_data.ti=
_emif_base_addr_virt =3D devm_platform_get_and_ioremap_resource(pdev,
8e6a257a173378d Krzysztof Kozlowski 2022-04-19  294  											   0,
8e6a257a173378d Krzysztof Kozlowski 2022-04-19  295  											   &res);
8428e5ad750d482 Dave Gerlach        2015-06-17  296  	if (IS_ERR(emif_data-=
>pm_data.ti_emif_base_addr_virt)) {
8428e5ad750d482 Dave Gerlach        2015-06-17  297  		ret =3D PTR_ERR(emif=
_data->pm_data.ti_emif_base_addr_virt);
8428e5ad750d482 Dave Gerlach        2015-06-17  298  		return ret;
8428e5ad750d482 Dave Gerlach        2015-06-17  299  	}
8428e5ad750d482 Dave Gerlach        2015-06-17  300  =

8428e5ad750d482 Dave Gerlach        2015-06-17  301  	emif_data->pm_data.ti=
_emif_base_addr_phys =3D res->start;
8428e5ad750d482 Dave Gerlach        2015-06-17  302  =

8428e5ad750d482 Dave Gerlach        2015-06-17  303  	ti_emif_configure_sr_=
delay(emif_data);
8428e5ad750d482 Dave Gerlach        2015-06-17  304  =

8428e5ad750d482 Dave Gerlach        2015-06-17  305  	ret =3D ti_emif_alloc=
_sram(dev, emif_data);
8428e5ad750d482 Dave Gerlach        2015-06-17  306  	if (ret)
8428e5ad750d482 Dave Gerlach        2015-06-17  307  		return ret;
8428e5ad750d482 Dave Gerlach        2015-06-17  308  =

8428e5ad750d482 Dave Gerlach        2015-06-17  309  	ret =3D ti_emif_push_=
sram(dev, emif_data);
8428e5ad750d482 Dave Gerlach        2015-06-17  310  	if (ret)
8428e5ad750d482 Dave Gerlach        2015-06-17  311  		goto fail_free_sram;
8428e5ad750d482 Dave Gerlach        2015-06-17  312  =

8428e5ad750d482 Dave Gerlach        2015-06-17  313  	emif_instance =3D emi=
f_data;
8428e5ad750d482 Dave Gerlach        2015-06-17  314  =

8428e5ad750d482 Dave Gerlach        2015-06-17  315  	return 0;
8428e5ad750d482 Dave Gerlach        2015-06-17  316  =

8428e5ad750d482 Dave Gerlach        2015-06-17  317  fail_free_sram:
8428e5ad750d482 Dave Gerlach        2015-06-17  318  	ti_emif_free_sram(emi=
f_data);
8428e5ad750d482 Dave Gerlach        2015-06-17  319  =

8428e5ad750d482 Dave Gerlach        2015-06-17  320  	return ret;
8428e5ad750d482 Dave Gerlach        2015-06-17  321  }
8428e5ad750d482 Dave Gerlach        2015-06-17  322  =


:::::: The code at line 278 was first introduced by commit
:::::: 8428e5ad750d482bdf077e81a1e9357332b3278c memory: ti-emif-sram: intro=
duce relocatable suspend/resume handlers

:::::: TO: Dave Gerlach <d-gerlach@ti.com>
:::::: CC: Santosh Shilimkar <santosh.shilimkar@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0732680754474431253==--


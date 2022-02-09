Content-Type: multipart/mixed; boundary="===============3498620684124333067=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [char-misc:char-misc-testing 12/47] drivers/misc/open-dice.c:130 open_dice_probe() warn: impossible condition '(rmem->size > (~0)) => (0-u32max > u32max)'
Date: Wed, 09 Feb 2022 20:05:04 +0800
Message-ID: <202202091905.4SY8mena-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3498620684124333067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Brazdil <dbrazdil@google.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t char-misc-testing
head:   0580565dd717cb135633ebdbc1d84fe6b0a3fa78
commit: f396ededbd8bf5911d588b683a3ce335844b7c89 [12/47] misc: open-dice: A=
dd driver to expose DICE data to userspace
:::::: branch date: 5 hours ago
:::::: commit date: 5 days ago
config: powerpc-randconfig-m031-20220208 (https://download.01.org/0day-ci/a=
rchive/20220209/202202091905.4SY8mena-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/misc/open-dice.c:130 open_dice_probe() warn: impossible condition '=
(rmem->size > (~0)) =3D> (0-u32max > u32max)'

vim +130 drivers/misc/open-dice.c

f396ededbd8bf5 David Brazdil 2022-01-26  115  =

f396ededbd8bf5 David Brazdil 2022-01-26  116  static int __init open_dice_p=
robe(struct platform_device *pdev)
f396ededbd8bf5 David Brazdil 2022-01-26  117  {
f396ededbd8bf5 David Brazdil 2022-01-26  118  	static unsigned int dev_idx;
f396ededbd8bf5 David Brazdil 2022-01-26  119  	struct device *dev =3D &pdev=
->dev;
f396ededbd8bf5 David Brazdil 2022-01-26  120  	struct reserved_mem *rmem;
f396ededbd8bf5 David Brazdil 2022-01-26  121  	struct open_dice_drvdata *dr=
vdata;
f396ededbd8bf5 David Brazdil 2022-01-26  122  	int ret;
f396ededbd8bf5 David Brazdil 2022-01-26  123  =

f396ededbd8bf5 David Brazdil 2022-01-26  124  	rmem =3D of_reserved_mem_loo=
kup(dev->of_node);
f396ededbd8bf5 David Brazdil 2022-01-26  125  	if (!rmem) {
f396ededbd8bf5 David Brazdil 2022-01-26  126  		dev_err(dev, "failed to loo=
kup reserved memory\n");
f396ededbd8bf5 David Brazdil 2022-01-26  127  		return -EINVAL;
f396ededbd8bf5 David Brazdil 2022-01-26  128  	}
f396ededbd8bf5 David Brazdil 2022-01-26  129  =

f396ededbd8bf5 David Brazdil 2022-01-26 @130  	if (!rmem->size || (rmem->si=
ze > ULONG_MAX)) {
f396ededbd8bf5 David Brazdil 2022-01-26  131  		dev_err(dev, "invalid memor=
y region size\n");
f396ededbd8bf5 David Brazdil 2022-01-26  132  		return -EINVAL;
f396ededbd8bf5 David Brazdil 2022-01-26  133  	}
f396ededbd8bf5 David Brazdil 2022-01-26  134  =

f396ededbd8bf5 David Brazdil 2022-01-26  135  	if (!PAGE_ALIGNED(rmem->base=
) || !PAGE_ALIGNED(rmem->size)) {
f396ededbd8bf5 David Brazdil 2022-01-26  136  		dev_err(dev, "memory region=
 must be page-aligned\n");
f396ededbd8bf5 David Brazdil 2022-01-26  137  		return -EINVAL;
f396ededbd8bf5 David Brazdil 2022-01-26  138  	}
f396ededbd8bf5 David Brazdil 2022-01-26  139  =

f396ededbd8bf5 David Brazdil 2022-01-26  140  	drvdata =3D devm_kmalloc(dev=
, sizeof(*drvdata), GFP_KERNEL);
f396ededbd8bf5 David Brazdil 2022-01-26  141  	if (!drvdata)
f396ededbd8bf5 David Brazdil 2022-01-26  142  		return -ENOMEM;
f396ededbd8bf5 David Brazdil 2022-01-26  143  =

f396ededbd8bf5 David Brazdil 2022-01-26  144  	*drvdata =3D (struct open_di=
ce_drvdata){
f396ededbd8bf5 David Brazdil 2022-01-26  145  		.lock =3D __MUTEX_INITIALIZ=
ER(drvdata->lock),
f396ededbd8bf5 David Brazdil 2022-01-26  146  		.rmem =3D rmem,
f396ededbd8bf5 David Brazdil 2022-01-26  147  		.misc =3D (struct miscdevic=
e){
f396ededbd8bf5 David Brazdil 2022-01-26  148  			.parent	=3D dev,
f396ededbd8bf5 David Brazdil 2022-01-26  149  			.name	=3D drvdata->name,
f396ededbd8bf5 David Brazdil 2022-01-26  150  			.minor	=3D MISC_DYNAMIC_MI=
NOR,
f396ededbd8bf5 David Brazdil 2022-01-26  151  			.fops	=3D &open_dice_fops,
f396ededbd8bf5 David Brazdil 2022-01-26  152  			.mode	=3D 0600,
f396ededbd8bf5 David Brazdil 2022-01-26  153  		},
f396ededbd8bf5 David Brazdil 2022-01-26  154  	};
f396ededbd8bf5 David Brazdil 2022-01-26  155  =

f396ededbd8bf5 David Brazdil 2022-01-26  156  	/* Index overflow check not =
needed, misc_register() will fail. */
f396ededbd8bf5 David Brazdil 2022-01-26  157  	snprintf(drvdata->name, size=
of(drvdata->name), DRIVER_NAME"%u", dev_idx++);
f396ededbd8bf5 David Brazdil 2022-01-26  158  =

f396ededbd8bf5 David Brazdil 2022-01-26  159  	ret =3D misc_register(&drvda=
ta->misc);
f396ededbd8bf5 David Brazdil 2022-01-26  160  	if (ret) {
f396ededbd8bf5 David Brazdil 2022-01-26  161  		dev_err(dev, "failed to reg=
ister misc device '%s': %d\n",
f396ededbd8bf5 David Brazdil 2022-01-26  162  			drvdata->name, ret);
f396ededbd8bf5 David Brazdil 2022-01-26  163  		return ret;
f396ededbd8bf5 David Brazdil 2022-01-26  164  	}
f396ededbd8bf5 David Brazdil 2022-01-26  165  =

f396ededbd8bf5 David Brazdil 2022-01-26  166  	platform_set_drvdata(pdev, d=
rvdata);
f396ededbd8bf5 David Brazdil 2022-01-26  167  	return 0;
f396ededbd8bf5 David Brazdil 2022-01-26  168  }
f396ededbd8bf5 David Brazdil 2022-01-26  169  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3498620684124333067==--


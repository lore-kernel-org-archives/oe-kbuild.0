Content-Type: multipart/mixed; boundary="===============4859978629722403693=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [asahilinux:bits/050-nvme 4/10] drivers/soc/apple/sart.c:193:2-8: ERROR: missing put_device; call of_find_device_by_node on line 178, but without a corresponding object release within this function.
Date: Sat, 09 Jul 2022 15:00:36 +0800
Message-ID: <202207091443.dnYp2Tfr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4859978629722403693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Sven Peter <sven@svenpeter.dev>
CC: Hector Martin <marcan@marcan.st>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://github.com/AsahiLinux/linux bits/050-nvme
head:   5b3910635863df45900af347c932d5468e7541fc
commit: 96470149f537ee4410acef69bb8a38d806fc98c1 [4/10] soc: apple: Add SAR=
T driver
:::::: branch date: 9 days ago
:::::: commit date: 7 weeks ago
config: sparc64-randconfig-c024-20220707 (https://download.01.org/0day-ci/a=
rchive/20220709/202207091443.dnYp2Tfr-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/soc/apple/sart.c:193:2-8: ERROR: missing put_device; call of_fin=
d_device_by_node on line 178, but without a corresponding object release wi=
thin this function.
   drivers/soc/apple/sart.c:198:1-7: ERROR: missing put_device; call of_fin=
d_device_by_node on line 178, but without a corresponding object release wi=
thin this function.

vim +193 drivers/soc/apple/sart.c

96470149f537ee4 Sven Peter 2022-04-26  166  =

96470149f537ee4 Sven Peter 2022-04-26  167  struct apple_sart *devm_apple_s=
art_get(struct device *dev)
96470149f537ee4 Sven Peter 2022-04-26  168  {
96470149f537ee4 Sven Peter 2022-04-26  169  	struct device_node *sart_node;
96470149f537ee4 Sven Peter 2022-04-26  170  	struct platform_device *sart_p=
dev;
96470149f537ee4 Sven Peter 2022-04-26  171  	struct apple_sart *sart;
96470149f537ee4 Sven Peter 2022-04-26  172  	int ret;
96470149f537ee4 Sven Peter 2022-04-26  173  =

96470149f537ee4 Sven Peter 2022-04-26  174  	sart_node =3D of_parse_phandle=
(dev->of_node, "apple,sart", 0);
96470149f537ee4 Sven Peter 2022-04-26  175  	if (!sart_node)
96470149f537ee4 Sven Peter 2022-04-26  176  		return ERR_PTR(-ENODEV);
96470149f537ee4 Sven Peter 2022-04-26  177  =

96470149f537ee4 Sven Peter 2022-04-26 @178  	sart_pdev =3D of_find_device_b=
y_node(sart_node);
96470149f537ee4 Sven Peter 2022-04-26  179  	of_node_put(sart_node);
96470149f537ee4 Sven Peter 2022-04-26  180  =

96470149f537ee4 Sven Peter 2022-04-26  181  	if (!sart_pdev)
96470149f537ee4 Sven Peter 2022-04-26  182  		return ERR_PTR(-ENODEV);
96470149f537ee4 Sven Peter 2022-04-26  183  =

96470149f537ee4 Sven Peter 2022-04-26  184  	sart =3D dev_get_drvdata(&sart=
_pdev->dev);
96470149f537ee4 Sven Peter 2022-04-26  185  	if (!sart) {
96470149f537ee4 Sven Peter 2022-04-26  186  		put_device(&sart_pdev->dev);
96470149f537ee4 Sven Peter 2022-04-26  187  		return ERR_PTR(-EPROBE_DEFER);
96470149f537ee4 Sven Peter 2022-04-26  188  	}
96470149f537ee4 Sven Peter 2022-04-26  189  =

96470149f537ee4 Sven Peter 2022-04-26  190  	ret =3D devm_add_action_or_res=
et(dev, (void (*)(void *))put_device,
96470149f537ee4 Sven Peter 2022-04-26  191  				       &sart_pdev->dev);
96470149f537ee4 Sven Peter 2022-04-26  192  	if (ret)
96470149f537ee4 Sven Peter 2022-04-26 @193  		return ERR_PTR(ret);
96470149f537ee4 Sven Peter 2022-04-26  194  =

96470149f537ee4 Sven Peter 2022-04-26  195  	device_link_add(dev, &sart_pde=
v->dev,
96470149f537ee4 Sven Peter 2022-04-26  196  			DL_FLAG_PM_RUNTIME | DL_FLAG=
_AUTOREMOVE_SUPPLIER);
96470149f537ee4 Sven Peter 2022-04-26  197  =

96470149f537ee4 Sven Peter 2022-04-26  198  	return sart;
96470149f537ee4 Sven Peter 2022-04-26  199  }
96470149f537ee4 Sven Peter 2022-04-26  200  EXPORT_SYMBOL(devm_apple_sart_g=
et);
96470149f537ee4 Sven Peter 2022-04-26  201  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4859978629722403693==--


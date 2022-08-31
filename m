Content-Type: multipart/mixed; boundary="===============6952642377267723502=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/libahci_platform.c:552 ahci_platform_get_resources() warn: passing zero to 'ERR_PTR'
Date: Wed, 31 Aug 2022 09:54:38 +0800
Message-ID: <202208310913.Hjkorbae-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6952642377267723502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Wang Hai <wanghai38@huawei.com>
CC: Damien Le Moal <damien.lemoal@wdc.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dcf8e5633e2e69ad60b730ab5905608b756a032f
commit: 776c75010803849c1cc4f11031a2b3960ab05202 ata: ahci_platform: fix nu=
ll-ptr-deref in ahci_platform_enable_regulators()
date:   11 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 11 months ago
config: xtensa-randconfig-m031-20220830 (https://download.01.org/0day-ci/ar=
chive/20220831/202208310913.Hjkorbae-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/ata/libahci_platform.c:552 ahci_platform_get_resources() warn: pass=
ing zero to 'ERR_PTR'

vim +/ERR_PTR +552 drivers/ata/libahci_platform.c

b1a9edbda040a4 Antoine Tenart            2014-07-30  513  =

c7d7ddee7e24ee Gregory CLEMENT           2015-01-15  514  			rc =3D ahci_pl=
atform_get_phy(hpriv, port, dev, child);
d7f76f36a8b4dc Nishka Dasgupta           2019-08-15  515  			if (rc) {
d7f76f36a8b4dc Nishka Dasgupta           2019-08-15  516  				of_node_put(c=
hild);
c7d7ddee7e24ee Gregory CLEMENT           2015-01-15  517  				goto err_out;
d7f76f36a8b4dc Nishka Dasgupta           2019-08-15  518  			}
c7d7ddee7e24ee Gregory CLEMENT           2015-01-15  519  =

b1a9edbda040a4 Antoine Tenart            2014-07-30  520  			enabled_ports+=
+;
b1a9edbda040a4 Antoine Tenart            2014-07-30  521  		}
b1a9edbda040a4 Antoine Tenart            2014-07-30  522  		if (!enabled_po=
rts) {
b1a9edbda040a4 Antoine Tenart            2014-07-30  523  			dev_warn(dev, =
"No port enabled\n");
b1a9edbda040a4 Antoine Tenart            2014-07-30  524  			rc =3D -ENODEV;
b1a9edbda040a4 Antoine Tenart            2014-07-30  525  			goto err_out;
b1a9edbda040a4 Antoine Tenart            2014-07-30  526  		}
b1a9edbda040a4 Antoine Tenart            2014-07-30  527  =

b1a9edbda040a4 Antoine Tenart            2014-07-30  528  		if (!hpriv->mas=
k_port_map)
b1a9edbda040a4 Antoine Tenart            2014-07-30  529  			hpriv->mask_po=
rt_map =3D mask_port_map;
b1a9edbda040a4 Antoine Tenart            2014-07-30  530  	} else {
b1a9edbda040a4 Antoine Tenart            2014-07-30  531  		/*
b1a9edbda040a4 Antoine Tenart            2014-07-30  532  		 * If no sub-no=
de was found, keep this for device tree
b1a9edbda040a4 Antoine Tenart            2014-07-30  533  		 * compatibility
b1a9edbda040a4 Antoine Tenart            2014-07-30  534  		 */
c7d7ddee7e24ee Gregory CLEMENT           2015-01-15  535  		rc =3D ahci_pla=
tform_get_phy(hpriv, 0, dev, dev->of_node);
c7d7ddee7e24ee Gregory CLEMENT           2015-01-15  536  		if (rc)
acbd573354bb7b Mikko Perttunen           2014-06-17  537  			goto err_out;
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  538  =

c7d7ddee7e24ee Gregory CLEMENT           2015-01-15  539  		rc =3D ahci_pla=
tform_get_regulator(hpriv, 0, dev);
c7d7ddee7e24ee Gregory CLEMENT           2015-01-15  540  		if (rc =3D=3D -=
EPROBE_DEFER)
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  541  			goto err_out;
b1a9edbda040a4 Antoine Tenart            2014-07-30  542  	}
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  543  	pm_runtime_enabl=
e(dev);
eac7e072d7e99f Tejun Heo                 2018-08-06  544  	pm_runtime_get_s=
ync(dev);
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  545  	hpriv->got_runti=
me_pm =3D true;
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  546  =

fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  547  	devres_remove_gr=
oup(dev, NULL);
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  548  	return hpriv;
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  549  =

fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  550  err_out:
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  551  	devres_release_g=
roup(dev, NULL);
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25 @552  	return ERR_PTR(r=
c);
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  553  }
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  554  EXPORT_SYMBOL_GPL=
(ahci_platform_get_resources);
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  555  =


:::::: The code at line 552 was first introduced by commit
:::::: fd990556f0fa25446c6bfa9cf4c9e49d387d4472 ata: move library code from=
 ahci_platform.c to libahci_platform.c

:::::: TO: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6952642377267723502==--


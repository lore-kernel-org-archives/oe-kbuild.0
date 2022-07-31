Content-Type: multipart/mixed; boundary="===============6171303075324194391=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/libahci_platform.c:552 ahci_platform_get_resources() warn: passing zero to 'ERR_PTR'
Date: Sun, 31 Jul 2022 15:00:10 +0800
Message-ID: <202207311447.RWacsQPY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6171303075324194391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Wang Hai <wanghai38@huawei.com>
CC: Damien Le Moal <damien.lemoal@wdc.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6a010258447d386186ca10cd374d888ac66ffe1a
commit: 776c75010803849c1cc4f11031a2b3960ab05202 ata: ahci_platform: fix nu=
ll-ptr-deref in ahci_platform_enable_regulators()
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
config: openrisc-randconfig-m041-20220731 (https://download.01.org/0day-ci/=
archive/20220731/202207311447.RWacsQPY-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/ata/libahci_platform.c:552 ahci_platform_get_resources() warn: pass=
ing zero to 'ERR_PTR'

vim +/ERR_PTR +552 drivers/ata/libahci_platform.c

b1a9edbda040a435 Antoine Tenart            2014-07-30  513  =

c7d7ddee7e24eedd Gregory CLEMENT           2015-01-15  514  			rc =3D ahci_=
platform_get_phy(hpriv, port, dev, child);
d7f76f36a8b4dc8e Nishka Dasgupta           2019-08-15  515  			if (rc) {
d7f76f36a8b4dc8e Nishka Dasgupta           2019-08-15  516  				of_node_put=
(child);
c7d7ddee7e24eedd Gregory CLEMENT           2015-01-15  517  				goto err_ou=
t;
d7f76f36a8b4dc8e Nishka Dasgupta           2019-08-15  518  			}
c7d7ddee7e24eedd Gregory CLEMENT           2015-01-15  519  =

b1a9edbda040a435 Antoine Tenart            2014-07-30  520  			enabled_port=
s++;
b1a9edbda040a435 Antoine Tenart            2014-07-30  521  		}
b1a9edbda040a435 Antoine Tenart            2014-07-30  522  		if (!enabled_=
ports) {
b1a9edbda040a435 Antoine Tenart            2014-07-30  523  			dev_warn(dev=
, "No port enabled\n");
b1a9edbda040a435 Antoine Tenart            2014-07-30  524  			rc =3D -ENOD=
EV;
b1a9edbda040a435 Antoine Tenart            2014-07-30  525  			goto err_out;
b1a9edbda040a435 Antoine Tenart            2014-07-30  526  		}
b1a9edbda040a435 Antoine Tenart            2014-07-30  527  =

b1a9edbda040a435 Antoine Tenart            2014-07-30  528  		if (!hpriv->m=
ask_port_map)
b1a9edbda040a435 Antoine Tenart            2014-07-30  529  			hpriv->mask_=
port_map =3D mask_port_map;
b1a9edbda040a435 Antoine Tenart            2014-07-30  530  	} else {
b1a9edbda040a435 Antoine Tenart            2014-07-30  531  		/*
b1a9edbda040a435 Antoine Tenart            2014-07-30  532  		 * If no sub-=
node was found, keep this for device tree
b1a9edbda040a435 Antoine Tenart            2014-07-30  533  		 * compatibil=
ity
b1a9edbda040a435 Antoine Tenart            2014-07-30  534  		 */
c7d7ddee7e24eedd Gregory CLEMENT           2015-01-15  535  		rc =3D ahci_p=
latform_get_phy(hpriv, 0, dev, dev->of_node);
c7d7ddee7e24eedd Gregory CLEMENT           2015-01-15  536  		if (rc)
acbd573354bb7b7b Mikko Perttunen           2014-06-17  537  			goto err_out;
fd990556f0fa2544 Bartlomiej Zolnierkiewicz 2014-03-25  538  =

c7d7ddee7e24eedd Gregory CLEMENT           2015-01-15  539  		rc =3D ahci_p=
latform_get_regulator(hpriv, 0, dev);
c7d7ddee7e24eedd Gregory CLEMENT           2015-01-15  540  		if (rc =3D=3D=
 -EPROBE_DEFER)
fd990556f0fa2544 Bartlomiej Zolnierkiewicz 2014-03-25  541  			goto err_out;
b1a9edbda040a435 Antoine Tenart            2014-07-30  542  	}
fd990556f0fa2544 Bartlomiej Zolnierkiewicz 2014-03-25  543  	pm_runtime_ena=
ble(dev);
eac7e072d7e99fad Tejun Heo                 2018-08-06  544  	pm_runtime_get=
_sync(dev);
fd990556f0fa2544 Bartlomiej Zolnierkiewicz 2014-03-25  545  	hpriv->got_run=
time_pm =3D true;
fd990556f0fa2544 Bartlomiej Zolnierkiewicz 2014-03-25  546  =

fd990556f0fa2544 Bartlomiej Zolnierkiewicz 2014-03-25  547  	devres_remove_=
group(dev, NULL);
fd990556f0fa2544 Bartlomiej Zolnierkiewicz 2014-03-25  548  	return hpriv;
fd990556f0fa2544 Bartlomiej Zolnierkiewicz 2014-03-25  549  =

fd990556f0fa2544 Bartlomiej Zolnierkiewicz 2014-03-25  550  err_out:
fd990556f0fa2544 Bartlomiej Zolnierkiewicz 2014-03-25  551  	devres_release=
_group(dev, NULL);
fd990556f0fa2544 Bartlomiej Zolnierkiewicz 2014-03-25 @552  	return ERR_PTR=
(rc);
fd990556f0fa2544 Bartlomiej Zolnierkiewicz 2014-03-25  553  }
fd990556f0fa2544 Bartlomiej Zolnierkiewicz 2014-03-25  554  EXPORT_SYMBOL_G=
PL(ahci_platform_get_resources);
fd990556f0fa2544 Bartlomiej Zolnierkiewicz 2014-03-25  555  =


:::::: The code at line 552 was first introduced by commit
:::::: fd990556f0fa25446c6bfa9cf4c9e49d387d4472 ata: move library code from=
 ahci_platform.c to libahci_platform.c

:::::: TO: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6171303075324194391==--


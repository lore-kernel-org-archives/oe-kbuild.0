Content-Type: multipart/mixed; boundary="===============1399963465419492971=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/mellanox/mlxreg-lc.c:905 mlxreg_lc_probe() warn: variable dereferenced before check 'data->notifier' (see line 828)
Date: Wed, 07 Sep 2022 01:11:35 +0800
Message-ID: <202209070122.axMlRp8d-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1399963465419492971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vadim Pasternak <vadimp@nvidia.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   53e99dcff61e1523ec1c3628b2d564ba15d32eb7
commit: 2f92fdd043d548a14287889742e147f8ed4ee03d platform/mellanox: Remove =
unnecessary code
date:   5 days ago
:::::: branch date: 19 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20907/202209070122.axMlRp8d-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/platform/mellanox/mlxreg-lc.c:905 mlxreg_lc_probe() warn: variable =
dereferenced before check 'data->notifier' (see line 828)

vim +905 drivers/platform/mellanox/mlxreg-lc.c

62f9529b8d5c87 Vadim Pasternak 2021-10-02  809  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  810  static int mlxreg_lc_probe(=
struct platform_device *pdev)
62f9529b8d5c87 Vadim Pasternak 2021-10-02  811  {
62f9529b8d5c87 Vadim Pasternak 2021-10-02  812  	struct mlxreg_core_hotplug=
_platform_data *par_pdata;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  813  	struct mlxreg_core_data *d=
ata;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  814  	struct mlxreg_lc *mlxreg_l=
c;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  815  	void *regmap;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  816  	int i, err;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  817  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  818  	data =3D dev_get_platdata(=
&pdev->dev);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  819  	if (!data)
62f9529b8d5c87 Vadim Pasternak 2021-10-02  820  		return -EINVAL;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  821  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  822  	mlxreg_lc =3D devm_kzalloc=
(&pdev->dev, sizeof(*mlxreg_lc), GFP_KERNEL);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  823  	if (!mlxreg_lc)
62f9529b8d5c87 Vadim Pasternak 2021-10-02  824  		return -ENOMEM;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  825  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  826  	mutex_init(&mlxreg_lc->loc=
k);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  827  	/* Set event notification =
callback. */
62f9529b8d5c87 Vadim Pasternak 2021-10-02 @828  	data->notifier->user_handl=
er =3D mlxreg_lc_event_handler;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  829  	data->notifier->handle =3D=
 mlxreg_lc;
2f92fdd043d548 Vadim Pasternak 2022-08-23  830  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  831  	data->hpdev.adapter =3D i2=
c_get_adapter(data->hpdev.nr);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  832  	if (!data->hpdev.adapter) {
62f9529b8d5c87 Vadim Pasternak 2021-10-02  833  		dev_err(&pdev->dev, "Fail=
ed to get adapter for bus %d\n",
62f9529b8d5c87 Vadim Pasternak 2021-10-02  834  			data->hpdev.nr);
b4b830a34d8046 Vadim Pasternak 2022-07-19  835  		err =3D -EFAULT;
b4b830a34d8046 Vadim Pasternak 2022-07-19  836  		goto i2c_get_adapter_fail;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  837  	}
62f9529b8d5c87 Vadim Pasternak 2021-10-02  838  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  839  	/* Create device at the to=
p of line card I2C tree.*/
62f9529b8d5c87 Vadim Pasternak 2021-10-02  840  	data->hpdev.client =3D i2c=
_new_client_device(data->hpdev.adapter,
62f9529b8d5c87 Vadim Pasternak 2021-10-02  841  						   data->hpdev.brdinf=
o);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  842  	if (IS_ERR(data->hpdev.cli=
ent)) {
62f9529b8d5c87 Vadim Pasternak 2021-10-02  843  		dev_err(&pdev->dev, "Fail=
ed to create client %s at bus %d at addr 0x%02x\n",
62f9529b8d5c87 Vadim Pasternak 2021-10-02  844  			data->hpdev.brdinfo->typ=
e, data->hpdev.nr, data->hpdev.brdinfo->addr);
b4b830a34d8046 Vadim Pasternak 2022-07-19  845  		err =3D PTR_ERR(data->hpd=
ev.client);
b4b830a34d8046 Vadim Pasternak 2022-07-19  846  		goto i2c_new_device_fail;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  847  	}
62f9529b8d5c87 Vadim Pasternak 2021-10-02  848  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  849  	regmap =3D devm_regmap_ini=
t_i2c(data->hpdev.client,
62f9529b8d5c87 Vadim Pasternak 2021-10-02  850  				      &mlxreg_lc_regmap=
_conf);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  851  	if (IS_ERR(regmap)) {
b4b830a34d8046 Vadim Pasternak 2022-07-19  852  		dev_err(&pdev->dev, "Fail=
ed to create regmap for client %s at bus %d at addr 0x%02x\n",
b4b830a34d8046 Vadim Pasternak 2022-07-19  853  			data->hpdev.brdinfo->typ=
e, data->hpdev.nr, data->hpdev.brdinfo->addr);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  854  		err =3D PTR_ERR(regmap);
b4b830a34d8046 Vadim Pasternak 2022-07-19  855  		goto devm_regmap_init_i2c=
_fail;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  856  	}
62f9529b8d5c87 Vadim Pasternak 2021-10-02  857  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  858  	/* Set default registers. =
*/
62f9529b8d5c87 Vadim Pasternak 2021-10-02  859  	for (i =3D 0; i < mlxreg_l=
c_regmap_conf.num_reg_defaults; i++) {
62f9529b8d5c87 Vadim Pasternak 2021-10-02  860  		err =3D regmap_write(regm=
ap, mlxreg_lc_regmap_default[i].reg,
62f9529b8d5c87 Vadim Pasternak 2021-10-02  861  				   mlxreg_lc_regmap_def=
ault[i].def);
b4b830a34d8046 Vadim Pasternak 2022-07-19  862  		if (err) {
b4b830a34d8046 Vadim Pasternak 2022-07-19  863  			dev_err(&pdev->dev, "Fai=
led to set default regmap %d for client %s at bus %d at addr 0x%02x\n",
b4b830a34d8046 Vadim Pasternak 2022-07-19  864  				i, data->hpdev.brdinfo-=
>type, data->hpdev.nr,
b4b830a34d8046 Vadim Pasternak 2022-07-19  865  				data->hpdev.brdinfo->ad=
dr);
b4b830a34d8046 Vadim Pasternak 2022-07-19  866  			goto regmap_write_fail;
b4b830a34d8046 Vadim Pasternak 2022-07-19  867  		}
62f9529b8d5c87 Vadim Pasternak 2021-10-02  868  	}
62f9529b8d5c87 Vadim Pasternak 2021-10-02  869  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  870  	/* Sync registers with har=
dware. */
62f9529b8d5c87 Vadim Pasternak 2021-10-02  871  	regcache_mark_dirty(regmap=
);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  872  	err =3D regcache_sync(regm=
ap);
b4b830a34d8046 Vadim Pasternak 2022-07-19  873  	if (err) {
b4b830a34d8046 Vadim Pasternak 2022-07-19  874  		dev_err(&pdev->dev, "Fail=
ed to sync regmap for client %s at bus %d at addr 0x%02x\n",
b4b830a34d8046 Vadim Pasternak 2022-07-19  875  			data->hpdev.brdinfo->typ=
e, data->hpdev.nr, data->hpdev.brdinfo->addr);
b4b830a34d8046 Vadim Pasternak 2022-07-19  876  		goto regcache_sync_fail;
b4b830a34d8046 Vadim Pasternak 2022-07-19  877  	}
62f9529b8d5c87 Vadim Pasternak 2021-10-02  878  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  879  	par_pdata =3D data->hpdev.=
brdinfo->platform_data;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  880  	mlxreg_lc->par_regmap =3D =
par_pdata->regmap;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  881  	mlxreg_lc->data =3D data;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  882  	mlxreg_lc->dev =3D &pdev->=
dev;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  883  	platform_set_drvdata(pdev,=
 mlxreg_lc);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  884  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  885  	/* Configure line card. */
62f9529b8d5c87 Vadim Pasternak 2021-10-02  886  	err =3D mlxreg_lc_config_i=
nit(mlxreg_lc, regmap, data);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  887  	if (err)
b4b830a34d8046 Vadim Pasternak 2022-07-19  888  		goto mlxreg_lc_config_ini=
t_fail;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  889  =

2f92fdd043d548 Vadim Pasternak 2022-08-23  890  	return 0;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  891  =

b4b830a34d8046 Vadim Pasternak 2022-07-19  892  mlxreg_lc_config_init_fail:
b4b830a34d8046 Vadim Pasternak 2022-07-19  893  regcache_sync_fail:
b4b830a34d8046 Vadim Pasternak 2022-07-19  894  regmap_write_fail:
b4b830a34d8046 Vadim Pasternak 2022-07-19  895  devm_regmap_init_i2c_fail:
b4b830a34d8046 Vadim Pasternak 2022-07-19  896  	if (data->hpdev.client) {
b4b830a34d8046 Vadim Pasternak 2022-07-19  897  		i2c_unregister_device(dat=
a->hpdev.client);
b4b830a34d8046 Vadim Pasternak 2022-07-19  898  		data->hpdev.client =3D NU=
LL;
b4b830a34d8046 Vadim Pasternak 2022-07-19  899  	}
b4b830a34d8046 Vadim Pasternak 2022-07-19  900  i2c_new_device_fail:
62f9529b8d5c87 Vadim Pasternak 2021-10-02  901  	i2c_put_adapter(data->hpde=
v.adapter);
b4b830a34d8046 Vadim Pasternak 2022-07-19  902  	data->hpdev.adapter =3D NU=
LL;
b4b830a34d8046 Vadim Pasternak 2022-07-19  903  i2c_get_adapter_fail:
b4b830a34d8046 Vadim Pasternak 2022-07-19  904  	/* Clear event notificatio=
n callback and handle. */
b4b830a34d8046 Vadim Pasternak 2022-07-19 @905  	if (data->notifier) {
b4b830a34d8046 Vadim Pasternak 2022-07-19  906  		data->notifier->user_hand=
ler =3D NULL;
b4b830a34d8046 Vadim Pasternak 2022-07-19  907  		data->notifier->handle =
=3D NULL;
b4b830a34d8046 Vadim Pasternak 2022-07-19  908  	}
62f9529b8d5c87 Vadim Pasternak 2021-10-02  909  	return err;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  910  }
62f9529b8d5c87 Vadim Pasternak 2021-10-02  911  =


:::::: The code at line 905 was first introduced by commit
:::::: b4b830a34d8046633231b7fe87f6f2cb6240dc9f platform/mellanox: mlxreg-l=
c: Fix error flow and extend verbosity

:::::: TO: Vadim Pasternak <vadimp@nvidia.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1399963465419492971==--


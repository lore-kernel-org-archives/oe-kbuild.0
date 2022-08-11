Content-Type: multipart/mixed; boundary="===============6353266899524177197=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/mellanox/mlxreg-lc.c:866 mlxreg_lc_probe() warn: passing zero to 'PTR_ERR'
Date: Fri, 12 Aug 2022 04:40:09 +0800
Message-ID: <202208120443.Eh0phNtZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6353266899524177197==
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
head:   2ae08b36c06ea8df73a79f6b80ff7964e006e9e3
commit: b4b830a34d8046633231b7fe87f6f2cb6240dc9f platform/mellanox: mlxreg-=
lc: Fix error flow and extend verbosity
date:   2 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20812/202208120443.Eh0phNtZ-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/platform/mellanox/mlxreg-lc.c:866 mlxreg_lc_probe() warn: passing z=
ero to 'PTR_ERR'

vim +/PTR_ERR +866 drivers/platform/mellanox/mlxreg-lc.c

62f9529b8d5c87 Vadim Pasternak 2021-10-02  798  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  799  static int mlxreg_lc_probe(=
struct platform_device *pdev)
62f9529b8d5c87 Vadim Pasternak 2021-10-02  800  {
62f9529b8d5c87 Vadim Pasternak 2021-10-02  801  	struct mlxreg_core_hotplug=
_platform_data *par_pdata;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  802  	struct mlxreg_core_data *d=
ata;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  803  	struct mlxreg_lc *mlxreg_l=
c;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  804  	void *regmap;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  805  	int i, err;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  806  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  807  	data =3D dev_get_platdata(=
&pdev->dev);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  808  	if (!data)
62f9529b8d5c87 Vadim Pasternak 2021-10-02  809  		return -EINVAL;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  810  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  811  	mlxreg_lc =3D devm_kzalloc=
(&pdev->dev, sizeof(*mlxreg_lc), GFP_KERNEL);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  812  	if (!mlxreg_lc)
62f9529b8d5c87 Vadim Pasternak 2021-10-02  813  		return -ENOMEM;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  814  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  815  	mutex_init(&mlxreg_lc->loc=
k);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  816  	/* Set event notification =
callback. */
62f9529b8d5c87 Vadim Pasternak 2021-10-02  817  	if (data->notifier) {
62f9529b8d5c87 Vadim Pasternak 2021-10-02  818  		data->notifier->user_hand=
ler =3D mlxreg_lc_event_handler;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  819  		data->notifier->handle =
=3D mlxreg_lc;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  820  	}
62f9529b8d5c87 Vadim Pasternak 2021-10-02  821  	data->hpdev.adapter =3D i2=
c_get_adapter(data->hpdev.nr);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  822  	if (!data->hpdev.adapter) {
62f9529b8d5c87 Vadim Pasternak 2021-10-02  823  		dev_err(&pdev->dev, "Fail=
ed to get adapter for bus %d\n",
62f9529b8d5c87 Vadim Pasternak 2021-10-02  824  			data->hpdev.nr);
b4b830a34d8046 Vadim Pasternak 2022-07-19  825  		err =3D -EFAULT;
b4b830a34d8046 Vadim Pasternak 2022-07-19  826  		goto i2c_get_adapter_fail;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  827  	}
62f9529b8d5c87 Vadim Pasternak 2021-10-02  828  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  829  	/* Create device at the to=
p of line card I2C tree.*/
62f9529b8d5c87 Vadim Pasternak 2021-10-02  830  	data->hpdev.client =3D i2c=
_new_client_device(data->hpdev.adapter,
62f9529b8d5c87 Vadim Pasternak 2021-10-02  831  						   data->hpdev.brdinf=
o);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  832  	if (IS_ERR(data->hpdev.cli=
ent)) {
62f9529b8d5c87 Vadim Pasternak 2021-10-02  833  		dev_err(&pdev->dev, "Fail=
ed to create client %s at bus %d at addr 0x%02x\n",
62f9529b8d5c87 Vadim Pasternak 2021-10-02  834  			data->hpdev.brdinfo->typ=
e, data->hpdev.nr, data->hpdev.brdinfo->addr);
b4b830a34d8046 Vadim Pasternak 2022-07-19  835  		err =3D PTR_ERR(data->hpd=
ev.client);
b4b830a34d8046 Vadim Pasternak 2022-07-19  836  		goto i2c_new_device_fail;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  837  	}
62f9529b8d5c87 Vadim Pasternak 2021-10-02  838  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  839  	regmap =3D devm_regmap_ini=
t_i2c(data->hpdev.client,
62f9529b8d5c87 Vadim Pasternak 2021-10-02  840  				      &mlxreg_lc_regmap=
_conf);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  841  	if (IS_ERR(regmap)) {
b4b830a34d8046 Vadim Pasternak 2022-07-19  842  		dev_err(&pdev->dev, "Fail=
ed to create regmap for client %s at bus %d at addr 0x%02x\n",
b4b830a34d8046 Vadim Pasternak 2022-07-19  843  			data->hpdev.brdinfo->typ=
e, data->hpdev.nr, data->hpdev.brdinfo->addr);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  844  		err =3D PTR_ERR(regmap);
b4b830a34d8046 Vadim Pasternak 2022-07-19  845  		goto devm_regmap_init_i2c=
_fail;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  846  	}
62f9529b8d5c87 Vadim Pasternak 2021-10-02  847  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  848  	/* Set default registers. =
*/
62f9529b8d5c87 Vadim Pasternak 2021-10-02  849  	for (i =3D 0; i < mlxreg_l=
c_regmap_conf.num_reg_defaults; i++) {
62f9529b8d5c87 Vadim Pasternak 2021-10-02  850  		err =3D regmap_write(regm=
ap, mlxreg_lc_regmap_default[i].reg,
62f9529b8d5c87 Vadim Pasternak 2021-10-02  851  				   mlxreg_lc_regmap_def=
ault[i].def);
b4b830a34d8046 Vadim Pasternak 2022-07-19  852  		if (err) {
b4b830a34d8046 Vadim Pasternak 2022-07-19  853  			dev_err(&pdev->dev, "Fai=
led to set default regmap %d for client %s at bus %d at addr 0x%02x\n",
b4b830a34d8046 Vadim Pasternak 2022-07-19  854  				i, data->hpdev.brdinfo-=
>type, data->hpdev.nr,
b4b830a34d8046 Vadim Pasternak 2022-07-19  855  				data->hpdev.brdinfo->ad=
dr);
b4b830a34d8046 Vadim Pasternak 2022-07-19  856  			goto regmap_write_fail;
b4b830a34d8046 Vadim Pasternak 2022-07-19  857  		}
62f9529b8d5c87 Vadim Pasternak 2021-10-02  858  	}
62f9529b8d5c87 Vadim Pasternak 2021-10-02  859  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  860  	/* Sync registers with har=
dware. */
62f9529b8d5c87 Vadim Pasternak 2021-10-02  861  	regcache_mark_dirty(regmap=
);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  862  	err =3D regcache_sync(regm=
ap);
b4b830a34d8046 Vadim Pasternak 2022-07-19  863  	if (err) {
b4b830a34d8046 Vadim Pasternak 2022-07-19  864  		dev_err(&pdev->dev, "Fail=
ed to sync regmap for client %s at bus %d at addr 0x%02x\n",
b4b830a34d8046 Vadim Pasternak 2022-07-19  865  			data->hpdev.brdinfo->typ=
e, data->hpdev.nr, data->hpdev.brdinfo->addr);
b4b830a34d8046 Vadim Pasternak 2022-07-19 @866  		err =3D PTR_ERR(regmap);
b4b830a34d8046 Vadim Pasternak 2022-07-19  867  		goto regcache_sync_fail;
b4b830a34d8046 Vadim Pasternak 2022-07-19  868  	}
62f9529b8d5c87 Vadim Pasternak 2021-10-02  869  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  870  	par_pdata =3D data->hpdev.=
brdinfo->platform_data;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  871  	mlxreg_lc->par_regmap =3D =
par_pdata->regmap;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  872  	mlxreg_lc->data =3D data;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  873  	mlxreg_lc->dev =3D &pdev->=
dev;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  874  	platform_set_drvdata(pdev,=
 mlxreg_lc);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  875  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  876  	/* Configure line card. */
62f9529b8d5c87 Vadim Pasternak 2021-10-02  877  	err =3D mlxreg_lc_config_i=
nit(mlxreg_lc, regmap, data);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  878  	if (err)
b4b830a34d8046 Vadim Pasternak 2022-07-19  879  		goto mlxreg_lc_config_ini=
t_fail;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  880  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  881  	return err;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  882  =

b4b830a34d8046 Vadim Pasternak 2022-07-19  883  mlxreg_lc_config_init_fail:
b4b830a34d8046 Vadim Pasternak 2022-07-19  884  regcache_sync_fail:
b4b830a34d8046 Vadim Pasternak 2022-07-19  885  regmap_write_fail:
b4b830a34d8046 Vadim Pasternak 2022-07-19  886  devm_regmap_init_i2c_fail:
b4b830a34d8046 Vadim Pasternak 2022-07-19  887  	if (data->hpdev.client) {
b4b830a34d8046 Vadim Pasternak 2022-07-19  888  		i2c_unregister_device(dat=
a->hpdev.client);
b4b830a34d8046 Vadim Pasternak 2022-07-19  889  		data->hpdev.client =3D NU=
LL;
b4b830a34d8046 Vadim Pasternak 2022-07-19  890  	}
b4b830a34d8046 Vadim Pasternak 2022-07-19  891  i2c_new_device_fail:
62f9529b8d5c87 Vadim Pasternak 2021-10-02  892  	i2c_put_adapter(data->hpde=
v.adapter);
b4b830a34d8046 Vadim Pasternak 2022-07-19  893  	data->hpdev.adapter =3D NU=
LL;
b4b830a34d8046 Vadim Pasternak 2022-07-19  894  i2c_get_adapter_fail:
b4b830a34d8046 Vadim Pasternak 2022-07-19  895  	/* Clear event notificatio=
n callback and handle. */
b4b830a34d8046 Vadim Pasternak 2022-07-19  896  	if (data->notifier) {
b4b830a34d8046 Vadim Pasternak 2022-07-19  897  		data->notifier->user_hand=
ler =3D NULL;
b4b830a34d8046 Vadim Pasternak 2022-07-19  898  		data->notifier->handle =
=3D NULL;
b4b830a34d8046 Vadim Pasternak 2022-07-19  899  	}
62f9529b8d5c87 Vadim Pasternak 2021-10-02  900  	return err;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  901  }
62f9529b8d5c87 Vadim Pasternak 2021-10-02  902  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6353266899524177197==--


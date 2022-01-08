Content-Type: multipart/mixed; boundary="===============4486772835574228294=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] hwmon: Add "label" attribute
Date: Sat, 08 Jan 2022 17:11:30 +0800
Message-ID: <202201081730.TlHZabuC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4486772835574228294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220105151551.20285-3-paul@crapouillou.net>
References: <20220105151551.20285-3-paul@crapouillou.net>
TO: Paul Cercueil <paul@crapouillou.net>
TO: Jean Delvare <jdelvare@suse.com>
TO: Guenter Roeck <linux@roeck-us.net>
TO: Jonathan Corbet <corbet@lwn.net>
CC: linux-hwmon(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-doc(a)vger.kernel.org
CC: list(a)opendingux.net
CC: Paul Cercueil <paul@crapouillou.net>
CC: Cosmin Tanislav <cosmin.tanislav@analog.com>

Hi Paul,

I love your patch! Perhaps something to improve:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on v5.16-rc8 next-20220107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Paul-Cercueil/hwmon-Add-la=
bel-attribute-v2/20220105-231930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-stagin=
g.git hwmon-next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20220105 (https://download.01.org/0day-ci/arch=
ive/20220108/202201081730.TlHZabuC-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hwmon/hwmon.c:851 __hwmon_device_register() error: uninitialized sy=
mbol 'hdev'.
drivers/hwmon/hwmon.c:854 __hwmon_device_register() warn: possible memory l=
eak of 'hwdev'

vim +/hdev +851 drivers/hwmon/hwmon.c

d560168b5d0fb4 Guenter Roeck    2015-08-26  744  =

d560168b5d0fb4 Guenter Roeck    2015-08-26  745  static struct device *
d560168b5d0fb4 Guenter Roeck    2015-08-26  746  __hwmon_device_register(st=
ruct device *dev, const char *name, void *drvdata,
d560168b5d0fb4 Guenter Roeck    2015-08-26  747  			const struct hwmon_chip=
_info *chip,
bab2243ce18978 Guenter Roeck    2013-07-06  748  			const struct attribute_=
group **groups)
1236441f38b6a9 Mark M. Hoffman  2005-07-15  749  {
bab2243ce18978 Guenter Roeck    2013-07-06  750  	struct hwmon_device *hwde=
v;
57dab49995d01d Paul Cercueil    2022-01-05  751  	const char *label;
d560168b5d0fb4 Guenter Roeck    2015-08-26  752  	struct device *hdev;
44e3ad882bb268 Akinobu Mita     2020-05-04  753  	int i, err, id;
ded2b666156130 Mark M. Hoffman  2006-03-05  754  =

74d3b6419772e4 Guenter Roeck    2017-01-27  755  	/* Complain about invalid=
 characters in hwmon name attribute */
648cd48c9e566f Guenter Roeck    2014-02-28  756  	if (name && (!strlen(name=
) || strpbrk(name, "-* \t\n")))
74d3b6419772e4 Guenter Roeck    2017-01-27  757  		dev_warn(dev,
74d3b6419772e4 Guenter Roeck    2017-01-27  758  			 "hwmon: '%s' is not a =
valid name attribute, please fix\n",
74d3b6419772e4 Guenter Roeck    2017-01-27  759  			 name);
648cd48c9e566f Guenter Roeck    2014-02-28  760  =

4ca5f468cc2a0b Jonathan Cameron 2011-10-31  761  	id =3D ida_simple_get(&hw=
mon_ida, 0, 0, GFP_KERNEL);
4ca5f468cc2a0b Jonathan Cameron 2011-10-31  762  	if (id < 0)
4ca5f468cc2a0b Jonathan Cameron 2011-10-31  763  		return ERR_PTR(id);
1236441f38b6a9 Mark M. Hoffman  2005-07-15  764  =

bab2243ce18978 Guenter Roeck    2013-07-06  765  	hwdev =3D kzalloc(sizeof(=
*hwdev), GFP_KERNEL);
bab2243ce18978 Guenter Roeck    2013-07-06  766  	if (hwdev =3D=3D NULL) {
bab2243ce18978 Guenter Roeck    2013-07-06  767  		err =3D -ENOMEM;
bab2243ce18978 Guenter Roeck    2013-07-06  768  		goto ida_remove;
bab2243ce18978 Guenter Roeck    2013-07-06  769  	}
1236441f38b6a9 Mark M. Hoffman  2005-07-15  770  =

57dab49995d01d Paul Cercueil    2022-01-05  771  	if (device_property_prese=
nt(dev, "label")) {
57dab49995d01d Paul Cercueil    2022-01-05  772  		err =3D device_property_=
read_string(dev, "label", &label);
57dab49995d01d Paul Cercueil    2022-01-05  773  		if (err < 0)
57dab49995d01d Paul Cercueil    2022-01-05  774  			goto free_hwmon;
57dab49995d01d Paul Cercueil    2022-01-05  775  =

57dab49995d01d Paul Cercueil    2022-01-05  776  		hwdev->label =3D kstrdup=
(label, GFP_KERNEL);
57dab49995d01d Paul Cercueil    2022-01-05  777  		if (hwdev->label =3D=3D =
NULL) {
57dab49995d01d Paul Cercueil    2022-01-05  778  			err =3D -ENOMEM;
57dab49995d01d Paul Cercueil    2022-01-05  779  			goto free_hwmon;
57dab49995d01d Paul Cercueil    2022-01-05  780  		}
57dab49995d01d Paul Cercueil    2022-01-05  781  	}
57dab49995d01d Paul Cercueil    2022-01-05  782  =

d560168b5d0fb4 Guenter Roeck    2015-08-26  783  	hdev =3D &hwdev->dev;
d560168b5d0fb4 Guenter Roeck    2015-08-26  784  =

239552f495b91f Guenter Roeck    2016-10-16  785  	if (chip) {
d560168b5d0fb4 Guenter Roeck    2015-08-26  786  		struct attribute **attrs;
b2a4cc3a060da0 Guenter Roeck    2016-10-16  787  		int ngroups =3D 2; /* te=
rminating NULL plus &hwdev->groups */
d560168b5d0fb4 Guenter Roeck    2015-08-26  788  =

d560168b5d0fb4 Guenter Roeck    2015-08-26  789  		if (groups)
d560168b5d0fb4 Guenter Roeck    2015-08-26  790  			for (i =3D 0; groups[i]=
; i++)
d560168b5d0fb4 Guenter Roeck    2015-08-26  791  				ngroups++;
d560168b5d0fb4 Guenter Roeck    2015-08-26  792  =

3bf8bdcf3bada7 Guenter Roeck    2020-01-16  793  		hwdev->groups =3D kcallo=
c(ngroups, sizeof(*groups), GFP_KERNEL);
38d8ed65092ed2 Colin Ian King   2016-10-23  794  		if (!hwdev->groups) {
38d8ed65092ed2 Colin Ian King   2016-10-23  795  			err =3D -ENOMEM;
38d8ed65092ed2 Colin Ian King   2016-10-23  796  			goto free_hwmon;
38d8ed65092ed2 Colin Ian King   2016-10-23  797  		}
d560168b5d0fb4 Guenter Roeck    2015-08-26  798  =

3bf8bdcf3bada7 Guenter Roeck    2020-01-16  799  		attrs =3D __hwmon_create=
_attrs(drvdata, chip);
d560168b5d0fb4 Guenter Roeck    2015-08-26  800  		if (IS_ERR(attrs)) {
d560168b5d0fb4 Guenter Roeck    2015-08-26  801  			err =3D PTR_ERR(attrs);
d560168b5d0fb4 Guenter Roeck    2015-08-26  802  			goto free_hwmon;
d560168b5d0fb4 Guenter Roeck    2015-08-26  803  		}
d560168b5d0fb4 Guenter Roeck    2015-08-26  804  =

d560168b5d0fb4 Guenter Roeck    2015-08-26  805  		hwdev->group.attrs =3D a=
ttrs;
d560168b5d0fb4 Guenter Roeck    2015-08-26  806  		ngroups =3D 0;
d560168b5d0fb4 Guenter Roeck    2015-08-26  807  		hwdev->groups[ngroups++]=
 =3D &hwdev->group;
d560168b5d0fb4 Guenter Roeck    2015-08-26  808  =

d560168b5d0fb4 Guenter Roeck    2015-08-26  809  		if (groups) {
d560168b5d0fb4 Guenter Roeck    2015-08-26  810  			for (i =3D 0; groups[i]=
; i++)
d560168b5d0fb4 Guenter Roeck    2015-08-26  811  				hwdev->groups[ngroups+=
+] =3D groups[i];
d560168b5d0fb4 Guenter Roeck    2015-08-26  812  		}
d560168b5d0fb4 Guenter Roeck    2015-08-26  813  =

d560168b5d0fb4 Guenter Roeck    2015-08-26  814  		hdev->groups =3D hwdev->=
groups;
d560168b5d0fb4 Guenter Roeck    2015-08-26  815  	} else {
d560168b5d0fb4 Guenter Roeck    2015-08-26  816  		hdev->groups =3D groups;
d560168b5d0fb4 Guenter Roeck    2015-08-26  817  	}
d560168b5d0fb4 Guenter Roeck    2015-08-26  818  =

bab2243ce18978 Guenter Roeck    2013-07-06  819  	hwdev->name =3D name;
d560168b5d0fb4 Guenter Roeck    2015-08-26  820  	hdev->class =3D &hwmon_cl=
ass;
d560168b5d0fb4 Guenter Roeck    2015-08-26  821  	hdev->parent =3D dev;
d560168b5d0fb4 Guenter Roeck    2015-08-26  822  	hdev->of_node =3D dev ? d=
ev->of_node : NULL;
d560168b5d0fb4 Guenter Roeck    2015-08-26  823  	hwdev->chip =3D chip;
d560168b5d0fb4 Guenter Roeck    2015-08-26  824  	dev_set_drvdata(hdev, drv=
data);
d560168b5d0fb4 Guenter Roeck    2015-08-26  825  	dev_set_name(hdev, HWMON_=
ID_FORMAT, id);
d560168b5d0fb4 Guenter Roeck    2015-08-26  826  	err =3D device_register(h=
dev);
ada61aa0b1184a Yang Yingliang   2021-10-12  827  	if (err) {
ada61aa0b1184a Yang Yingliang   2021-10-12  828  		put_device(hdev);
ada61aa0b1184a Yang Yingliang   2021-10-12  829  		goto ida_remove;
ada61aa0b1184a Yang Yingliang   2021-10-12  830  	}
d560168b5d0fb4 Guenter Roeck    2015-08-26  831  =

1597b374af2226 Guenter Roeck    2020-05-28  832  	INIT_LIST_HEAD(&hwdev->tz=
data);
1597b374af2226 Guenter Roeck    2020-05-28  833  =

c41dd48e21fae3 Eduardo Valentin 2019-05-29  834  	if (dev && dev->of_node &=
& chip && chip->ops->read &&
d560168b5d0fb4 Guenter Roeck    2015-08-26  835  	    chip->info[0]->type =
=3D=3D hwmon_chip &&
d560168b5d0fb4 Guenter Roeck    2015-08-26  836  	    (chip->info[0]->confi=
g[0] & HWMON_C_REGISTER_TZ)) {
44e3ad882bb268 Akinobu Mita     2020-05-04  837  		err =3D hwmon_thermal_re=
gister_sensors(hdev);
74e3512731bd5c Dmitry Osipenko  2018-10-24  838  		if (err) {
74e3512731bd5c Dmitry Osipenko  2018-10-24  839  			device_unregister(hdev);
792eac18431967 Guenter Roeck    2019-06-06  840  			/*
44e3ad882bb268 Akinobu Mita     2020-05-04  841  			 * Don't worry about hw=
dev; hwmon_dev_release(), called
44e3ad882bb268 Akinobu Mita     2020-05-04  842  			 * from device_unregist=
er(), will free it.
792eac18431967 Guenter Roeck    2019-06-06  843  			 */
74e3512731bd5c Dmitry Osipenko  2018-10-24  844  			goto ida_remove;
74e3512731bd5c Dmitry Osipenko  2018-10-24  845  		}
47c332deb8e89f Linus Walleij    2017-12-05  846  	}
bab2243ce18978 Guenter Roeck    2013-07-06  847  =

d560168b5d0fb4 Guenter Roeck    2015-08-26  848  	return hdev;
bab2243ce18978 Guenter Roeck    2013-07-06  849  =

d560168b5d0fb4 Guenter Roeck    2015-08-26  850  free_hwmon:
3bf8bdcf3bada7 Guenter Roeck    2020-01-16 @851  	hwmon_dev_release(hdev);
bab2243ce18978 Guenter Roeck    2013-07-06  852  ida_remove:
4ca5f468cc2a0b Jonathan Cameron 2011-10-31  853  	ida_simple_remove(&hwmon_=
ida, id);
bab2243ce18978 Guenter Roeck    2013-07-06 @854  	return ERR_PTR(err);
bab2243ce18978 Guenter Roeck    2013-07-06  855  }
d560168b5d0fb4 Guenter Roeck    2015-08-26  856  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4486772835574228294==--


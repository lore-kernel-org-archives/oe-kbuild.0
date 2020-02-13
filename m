Content-Type: multipart/mixed; boundary="===============6681924883222207822=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 2/2] input: adp5589: Add basic devicetree support
Date: Thu, 13 Feb 2020 09:52:10 +0300
Message-ID: <20200213065210.GE7838@kadam>
In-Reply-To: <20200205142218.15973-2-alexandru.ardelean@analog.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6681924883222207822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexandru,

url:    https://urldefense.com/v3/__https://github.com/0day-ci/linux/commit=
s/Alexandru-Ardelean/input-adp5589-Add-default-platform-data/20200206-07394=
4__;!!GqivPVa7Brio!MY2_vTOsanTGzkj1sG9gmxs-c72f_T0MK8vYxgXFLKcqgchKaYGVs4ZR=
unDQ5YstlQ$ =

base:   https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/ke=
rnel/git/dtor/input.git__;!!GqivPVa7Brio!MY2_vTOsanTGzkj1sG9gmxs-c72f_T0MK8=
vYxgXFLKcqgchKaYGVs4ZRunDPI_jD3g$  next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/input/keyboard/adp5589-keys.c:1053 adp5589_probe() warn: possible m=
emory leak of 'kpad'

Old smatch warnings:
drivers/input/keyboard/adp5589-keys.c:913 adp5589_keypad_add() error: we pr=
eviously assumed 'pdata->gpimap' could be null (see line 902)

# https://urldefense.com/v3/__https://github.com/0day-ci/linux/commit/e537d=
c5175805cf765da36bdd9cafe98b0a191d9__;!!GqivPVa7Brio!MY2_vTOsanTGzkj1sG9gmx=
s-c72f_T0MK8vYxgXFLKcqgchKaYGVs4ZRunBH8qj3xg$ =

git remote add linux-review https://urldefense.com/v3/__https://github.com/=
0day-ci/linux__;!!GqivPVa7Brio!MY2_vTOsanTGzkj1sG9gmxs-c72f_T0MK8vYxgXFLKcq=
gchKaYGVs4ZRunDP90BKkw$ =

git remote update linux-review
git checkout e537dc5175805cf765da36bdd9cafe98b0a191d9
vim +/kpad +1053 drivers/input/keyboard/adp5589-keys.c

cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1030  static int adp5589_prob=
e(struct i2c_client *client,
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1031  			 const struct i2c_de=
vice_id *id)
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1032  {
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1033  	struct adp5589_kpad *k=
pad;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1034  	const struct adp5589_k=
pad_platform_data *pdata =3D
ba322093a2bfbb Lars-Peter Clausen 2020-02-05  1035  		adp5589_kpad_pdata_ge=
t(&client->dev);
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1036  	unsigned int revid;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1037  	int error, ret;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1038  =

cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1039  	if (!i2c_check_functio=
nality(client->adapter,
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1040  				     I2C_FUNC_SMBUS=
_BYTE_DATA)) {
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1041  		dev_err(&client->dev,=
 "SMBUS Byte Data not Supported\n");
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1042  		return -EIO;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1043  	}
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1044  =

cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1045  	kpad =3D kzalloc(sizeo=
f(*kpad), GFP_KERNEL);
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1046  	if (!kpad)
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1047  		return -ENOMEM;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1048  =

cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1049  	kpad->client =3D clien=
t;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1050  =

e537dc5175805c Lars-Peter Clausen 2020-02-05  1051  	ret =3D adp5589_i2c_ge=
t_driver_data(client, id);
e537dc5175805c Lars-Peter Clausen 2020-02-05  1052  	if (ret < 0)
e537dc5175805c Lars-Peter Clausen 2020-02-05 @1053  		return ret;

	error =3D ret;
	goto err_free_mem;

Better to just delete the "error" variable though and make everything
ret.

e537dc5175805c Lars-Peter Clausen 2020-02-05  1054  =

e537dc5175805c Lars-Peter Clausen 2020-02-05  1055  	switch (ret) {
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1056  	case ADP5585_02:
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1057  		kpad->support_row5 =
=3D true;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1058  		/* fall through */
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1059  	case ADP5585_01:
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1060  		kpad->is_adp5585 =3D =
true;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1061  		kpad->var =3D &const_=
adp5585;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1062  		break;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1063  	case ADP5589:
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1064  		kpad->support_row5 =
=3D true;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1065  		kpad->var =3D &const_=
adp5589;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1066  		break;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1067  	}
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1068  =

cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1069  	ret =3D adp5589_read(c=
lient, ADP5589_5_ID);
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1070  	if (ret < 0) {
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1071  		error =3D ret;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1072  		goto err_free_mem;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1073  	}
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1074  =

cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1075  	revid =3D (u8) ret & A=
DP5589_5_DEVICE_ID_MASK;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1076  =

cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1077  	if (pdata->keymapsize)=
 {
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1078  		error =3D adp5589_key=
pad_add(kpad, revid);
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1079  		if (error)
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1080  			goto err_free_mem;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1081  	}
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1082  =

9d2e173644bb5c Michael Hennerich  2011-05-19  1083  	error =3D adp5589_setu=
p(kpad);
9d2e173644bb5c Michael Hennerich  2011-05-19  1084  	if (error)
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1085  		goto err_keypad_remov=
e;
9d2e173644bb5c Michael Hennerich  2011-05-19  1086  =

9d2e173644bb5c Michael Hennerich  2011-05-19  1087  	if (kpad->gpimapsize)
9d2e173644bb5c Michael Hennerich  2011-05-19  1088  		adp5589_report_switch=
_state(kpad);
9d2e173644bb5c Michael Hennerich  2011-05-19  1089  =

9d2e173644bb5c Michael Hennerich  2011-05-19  1090  	error =3D adp5589_gpio=
_add(kpad);
9d2e173644bb5c Michael Hennerich  2011-05-19  1091  	if (error)
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1092  		goto err_keypad_remov=
e;
9d2e173644bb5c Michael Hennerich  2011-05-19  1093  =

9d2e173644bb5c Michael Hennerich  2011-05-19  1094  	i2c_set_clientdata(cli=
ent, kpad);
9d2e173644bb5c Michael Hennerich  2011-05-19  1095  =

9d2e173644bb5c Michael Hennerich  2011-05-19  1096  	dev_info(&client->dev,=
 "Rev.%d keypad, irq %d\n", revid, client->irq);
9d2e173644bb5c Michael Hennerich  2011-05-19  1097  	return 0;
9d2e173644bb5c Michael Hennerich  2011-05-19  1098  =

cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1099  err_keypad_remove:
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1100  	adp5589_keypad_remove(=
kpad);
3f48e735435851 Michael Hennerich  2011-10-18  1101  err_free_mem:
9d2e173644bb5c Michael Hennerich  2011-05-19  1102  	kfree(kpad);
9d2e173644bb5c Michael Hennerich  2011-05-19  1103  =

9d2e173644bb5c Michael Hennerich  2011-05-19  1104  	return error;
9d2e173644bb5c Michael Hennerich  2011-05-19  1105  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://urldefense.com/v3/__https://lists.01.org/hyperkitty/list/kbuild-all=
(a)lists.01.org__;!!GqivPVa7Brio!MY2_vTOsanTGzkj1sG9gmxs-c72f_T0MK8vYxgXFLK=
cqgchKaYGVs4ZRunCDo3i4pw$=20
--===============6681924883222207822==--


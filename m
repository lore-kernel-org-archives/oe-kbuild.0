Content-Type: multipart/mixed; boundary="===============6718522191576224147=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [linux-next:master 5983/6376] net/dsa/dsa2.c:849 dsa_switch_probe() warn: variable dereferenced before check 'ds->dev' (see line 845)
Date: Wed, 23 Oct 2019 15:25:36 +0300
Message-ID: <20191023122536.GA17535@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6718522191576224147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f3c452cfc59c817950b150b51ec2b33409d7640b
commit: 7e99e34701728d54ccd0466eccf377a42b9db215 [5983/6376] net: dsa: remo=
ve dsa_switch_alloc helper

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/dsa/dsa2.c:849 dsa_switch_probe() warn: variable dereferenced before ch=
eck 'ds->dev' (see line 845)

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D7e99e34701728d54ccd0466eccf377a42b9db215
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout 7e99e34701728d54ccd0466eccf377a42b9db215
vim +849 net/dsa/dsa2.c

b4fbb347fe4cd7 Vivien Didelot 2017-11-06  843  static int dsa_switch_probe(=
struct dsa_switch *ds)
83c0afaec7b730 Andrew Lunn    2016-06-04  844  {
23c9ee4934e7a7 Vivien Didelot 2017-05-26 @845  	struct dsa_chip_data *pdata=
 =3D ds->dev->platform_data;
                                                                           =
   ^^^^^^^^^^^^^^^^^^^^^^
Dereference.

23c9ee4934e7a7 Vivien Didelot 2017-05-26  846  	struct device_node *np =3D =
ds->dev->of_node;
34c09a8916fb52 Vivien Didelot 2017-11-06  847  	int err;
83c0afaec7b730 Andrew Lunn    2016-06-04  848  =

7e99e34701728d Vivien Didelot 2019-10-21 @849  	if (!ds->dev)
                                                     ^^^^^^^
Check too late.

7e99e34701728d Vivien Didelot 2019-10-21  850  		return -ENODEV;
7e99e34701728d Vivien Didelot 2019-10-21  851  =

7e99e34701728d Vivien Didelot 2019-10-21  852  	if (!ds->num_ports)
7e99e34701728d Vivien Didelot 2019-10-21  853  		return -EINVAL;
7e99e34701728d Vivien Didelot 2019-10-21  854  =

975e6e32215e6c Vivien Didelot 2017-11-03  855  	if (np)
975e6e32215e6c Vivien Didelot 2017-11-03  856  		err =3D dsa_switch_parse_o=
f(ds, np);
975e6e32215e6c Vivien Didelot 2017-11-03  857  	else if (pdata)
975e6e32215e6c Vivien Didelot 2017-11-03  858  		err =3D dsa_switch_parse(d=
s, pdata);
975e6e32215e6c Vivien Didelot 2017-11-03  859  	else
975e6e32215e6c Vivien Didelot 2017-11-03  860  		err =3D -ENODEV;
83c0afaec7b730 Andrew Lunn    2016-06-04  861  =

0eefe2c1730020 Vivien Didelot 2017-11-03  862  	if (err)
0eefe2c1730020 Vivien Didelot 2017-11-03  863  		return err;
975e6e32215e6c Vivien Didelot 2017-11-03  864  =

308173546ac434 Vivien Didelot 2017-11-06  865  	return dsa_switch_add(ds);
83c0afaec7b730 Andrew Lunn    2016-06-04  866  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============6718522191576224147==--


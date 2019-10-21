Content-Type: multipart/mixed; boundary="===============0696117441356790941=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [thierryreding:for-5.5/dp 79/124] drivers/memory/core.c:79 of_memory_controller_get() error: double unlock 'mutex:&controllers_lock'
Date: Mon, 21 Oct 2019 10:54:28 +0300
Message-ID: <20191021075428.GA10833@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0696117441356790941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/thierryreding/linux for-5.5/dp
head:   c80326581f9bf16162c2f3d5dcc5f006bbc93f86
commit: 429583789bbda8c3ef59f9b6c33fb483145752a4 [79/124] memory: Introduce=
 memory controller mini-framework

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/memory/core.c:79 of_memory_controller_get() error: double unlock 'm=
utex:&controllers_lock'

Old smatch warnings:
include/linux/compiler.h:226 __write_once_size() warn: potential memory cor=
rupting cast 8 vs 4 bytes

# https://github.com/thierryreding/linux/commit/429583789bbda8c3ef59f9b6c33=
fb483145752a4
git remote add thierryreding https://github.com/thierryreding/linux
git remote update thierryreding
git checkout 429583789bbda8c3ef59f9b6c33fb483145752a4
vim +79 drivers/memory/core.c

429583789bbda8 Thierry Reding 2019-08-20  41  static struct memory_controll=
er *
429583789bbda8 Thierry Reding 2019-08-20  42  of_memory_controller_get(stru=
ct device *dev, struct device_node *np,
429583789bbda8 Thierry Reding 2019-08-20  43  			 const char *con_id)
429583789bbda8 Thierry Reding 2019-08-20  44  {
429583789bbda8 Thierry Reding 2019-08-20  45  	const char *cells =3D "#memo=
ry-controller-cells";
429583789bbda8 Thierry Reding 2019-08-20  46  	const char *names =3D "memor=
y-controller-names";
429583789bbda8 Thierry Reding 2019-08-20  47  	const char *prop =3D "memory=
-controllers";
429583789bbda8 Thierry Reding 2019-08-20  48  	struct memory_controller *mc;
429583789bbda8 Thierry Reding 2019-08-20  49  	struct of_phandle_args args;
429583789bbda8 Thierry Reding 2019-08-20  50  	int index =3D 0, err;
429583789bbda8 Thierry Reding 2019-08-20  51  =

429583789bbda8 Thierry Reding 2019-08-20  52  	if (con_id) {
429583789bbda8 Thierry Reding 2019-08-20  53  		index =3D of_property_match=
_string(np, names, con_id);
429583789bbda8 Thierry Reding 2019-08-20  54  		if (index < 0)
429583789bbda8 Thierry Reding 2019-08-20  55  			return ERR_PTR(index);
429583789bbda8 Thierry Reding 2019-08-20  56  	}
429583789bbda8 Thierry Reding 2019-08-20  57  =

429583789bbda8 Thierry Reding 2019-08-20  58  	err =3D of_parse_phandle_wit=
h_args(np, prop, cells, index, &args);
429583789bbda8 Thierry Reding 2019-08-20  59  	if (err) {
429583789bbda8 Thierry Reding 2019-08-20  60  		if (err =3D=3D -ENOENT)
429583789bbda8 Thierry Reding 2019-08-20  61  			err =3D -ENODEV;
429583789bbda8 Thierry Reding 2019-08-20  62  =

429583789bbda8 Thierry Reding 2019-08-20  63  		return ERR_PTR(err);
429583789bbda8 Thierry Reding 2019-08-20  64  	}
429583789bbda8 Thierry Reding 2019-08-20  65  =

429583789bbda8 Thierry Reding 2019-08-20  66  	mutex_lock(&controllers_lock=
);
429583789bbda8 Thierry Reding 2019-08-20  67  =

429583789bbda8 Thierry Reding 2019-08-20  68  	list_for_each_entry(mc, &con=
trollers, list) {
429583789bbda8 Thierry Reding 2019-08-20  69  		if (mc->dev && mc->dev->of_=
node =3D=3D args.np) {
429583789bbda8 Thierry Reding 2019-08-20  70  			kref_get(&mc->ref);
429583789bbda8 Thierry Reding 2019-08-20  71  			mutex_unlock(&controllers_=
lock);
                                                                ^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^

429583789bbda8 Thierry Reding 2019-08-20  72  			goto unlock;
429583789bbda8 Thierry Reding 2019-08-20  73  		}
429583789bbda8 Thierry Reding 2019-08-20  74  	}
429583789bbda8 Thierry Reding 2019-08-20  75  =

429583789bbda8 Thierry Reding 2019-08-20  76  	mc =3D ERR_PTR(-EPROBE_DEFER=
);
429583789bbda8 Thierry Reding 2019-08-20  77  =

429583789bbda8 Thierry Reding 2019-08-20  78  unlock:
429583789bbda8 Thierry Reding 2019-08-20 @79  	mutex_unlock(&controllers_lo=
ck);
                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^
429583789bbda8 Thierry Reding 2019-08-20  80  	of_node_put(args.np);
429583789bbda8 Thierry Reding 2019-08-20  81  	return mc;
429583789bbda8 Thierry Reding 2019-08-20  82  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============0696117441356790941==--


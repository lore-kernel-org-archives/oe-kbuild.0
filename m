Content-Type: multipart/mixed; boundary="===============6628615880095286526=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c:57 mt7921_acpi_read() error: dereferencing freed memory 'sar_root'
Date: Thu, 18 Aug 2022 15:48:00 +0800
Message-ID: <202208181543.V5DNm77M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6628615880095286526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Deren Wu <deren.wu@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Sean Wang <sean.wang@mediatek.com>
CC: Quan Zhou <quan.zhou@mediatek.com>
CC: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3b06a2755758937add738545ba4a544fc5a1c56d
commit: f965333e491e36adb0fa91e389fba8685b704fb6 mt76: mt7921: introduce AC=
PI SAR support
date:   5 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 5 weeks ago
config: ia64-randconfig-m031-20220814 (https://download.01.org/0day-ci/arch=
ive/20220818/202208181543.V5DNm77M-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c:57 mt7921_acpi_read() =
error: dereferencing freed memory 'sar_root'

vim +/sar_root +57 drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c

f965333e491e36 Deren Wu 2022-05-20   6  =

f965333e491e36 Deren Wu 2022-05-20   7  static int
f965333e491e36 Deren Wu 2022-05-20   8  mt7921_acpi_read(struct mt7921_dev =
*dev, u8 *method, u8 **tbl, u32 *len)
f965333e491e36 Deren Wu 2022-05-20   9  {
f965333e491e36 Deren Wu 2022-05-20  10  	struct acpi_buffer buf =3D { ACPI_=
ALLOCATE_BUFFER, NULL };
f965333e491e36 Deren Wu 2022-05-20  11  	union acpi_object *sar_root, *sar_=
unit;
f965333e491e36 Deren Wu 2022-05-20  12  	struct mt76_dev *mdev =3D &dev->mt=
76;
f965333e491e36 Deren Wu 2022-05-20  13  	acpi_handle root, handle;
f965333e491e36 Deren Wu 2022-05-20  14  	acpi_status status;
f965333e491e36 Deren Wu 2022-05-20  15  	u32 i =3D 0;
f965333e491e36 Deren Wu 2022-05-20  16  =

f965333e491e36 Deren Wu 2022-05-20  17  	root =3D ACPI_HANDLE(mdev->dev);
f965333e491e36 Deren Wu 2022-05-20  18  	if (!root)
f965333e491e36 Deren Wu 2022-05-20  19  		return -EOPNOTSUPP;
f965333e491e36 Deren Wu 2022-05-20  20  =

f965333e491e36 Deren Wu 2022-05-20  21  	status =3D acpi_get_handle(root, m=
ethod, &handle);
f965333e491e36 Deren Wu 2022-05-20  22  	if (ACPI_FAILURE(status))
f965333e491e36 Deren Wu 2022-05-20  23  		return -EIO;
f965333e491e36 Deren Wu 2022-05-20  24  =

f965333e491e36 Deren Wu 2022-05-20  25  	status =3D acpi_evaluate_object(ha=
ndle, NULL, NULL, &buf);
f965333e491e36 Deren Wu 2022-05-20  26  	if (ACPI_FAILURE(status))
f965333e491e36 Deren Wu 2022-05-20  27  		return -EIO;
f965333e491e36 Deren Wu 2022-05-20  28  =

f965333e491e36 Deren Wu 2022-05-20  29  	sar_root =3D buf.pointer;
f965333e491e36 Deren Wu 2022-05-20  30  	if (sar_root->type !=3D ACPI_TYPE_=
PACKAGE ||
f965333e491e36 Deren Wu 2022-05-20  31  	    sar_root->package.count < 4 ||
f965333e491e36 Deren Wu 2022-05-20  32  	    sar_root->package.elements[0].=
type !=3D ACPI_TYPE_INTEGER) {
f965333e491e36 Deren Wu 2022-05-20  33  		dev_err(mdev->dev, "sar cnt =3D %=
d\n",
f965333e491e36 Deren Wu 2022-05-20  34  			sar_root->package.count);
f965333e491e36 Deren Wu 2022-05-20  35  		goto free;
f965333e491e36 Deren Wu 2022-05-20  36  	}
f965333e491e36 Deren Wu 2022-05-20  37  =

f965333e491e36 Deren Wu 2022-05-20  38  	if (!*tbl) {
f965333e491e36 Deren Wu 2022-05-20  39  		*tbl =3D devm_kzalloc(mdev->dev, =
sar_root->package.count,
f965333e491e36 Deren Wu 2022-05-20  40  				    GFP_KERNEL);
f965333e491e36 Deren Wu 2022-05-20  41  		if (!*tbl)
f965333e491e36 Deren Wu 2022-05-20  42  			goto free;
f965333e491e36 Deren Wu 2022-05-20  43  	}
f965333e491e36 Deren Wu 2022-05-20  44  	if (len)
f965333e491e36 Deren Wu 2022-05-20  45  		*len =3D sar_root->package.count;
f965333e491e36 Deren Wu 2022-05-20  46  =

f965333e491e36 Deren Wu 2022-05-20  47  	for (i =3D 0; i < sar_root->packag=
e.count; i++) {
f965333e491e36 Deren Wu 2022-05-20  48  		sar_unit =3D &sar_root->package.e=
lements[i];
f965333e491e36 Deren Wu 2022-05-20  49  =

f965333e491e36 Deren Wu 2022-05-20  50  		if (sar_unit->type !=3D ACPI_TYPE=
_INTEGER)
f965333e491e36 Deren Wu 2022-05-20  51  			break;
f965333e491e36 Deren Wu 2022-05-20  52  		*(*tbl + i) =3D (u8)sar_unit->int=
eger.value;
f965333e491e36 Deren Wu 2022-05-20  53  	}
f965333e491e36 Deren Wu 2022-05-20  54  free:
f965333e491e36 Deren Wu 2022-05-20  55  	kfree(sar_root);
f965333e491e36 Deren Wu 2022-05-20  56  =

f965333e491e36 Deren Wu 2022-05-20 @57  	return (i =3D=3D sar_root->package=
.count) ? 0 : -EINVAL;
f965333e491e36 Deren Wu 2022-05-20  58  }
f965333e491e36 Deren Wu 2022-05-20  59  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6628615880095286526==--


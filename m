Content-Type: multipart/mixed; boundary="===============3000839182806520083=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [afaerber:rtd1295-next 10/172] drivers/soc/realtek/chip.c:138:23: warning: Either the condition 's' is redundant or there is possible null pointer dereference: s.
Date: Sun, 21 Jun 2020 00:49:15 +0800
Message-ID: <202006210012.XhQEWsoJ%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3000839182806520083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Andreas F=C3=A4rber" <afaerber@suse.de>

tree:   https://github.com/afaerber/linux.git rtd1295-next
head:   025d88499eb44cb4144fc8b8dbe49c9743b4fa8e
commit: 3f4c278fe7b4caaa89ea7b9563c9aad1f2c1f278 [10/172] soc: Add Realtek =
chip info driver for RTD1195 and RTD1295
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/soc/realtek/chip.c:138:23: warning: Either the condition 's' is =
redundant or there is possible null pointer dereference: s. [nullPointerRed=
undantCheck]
     ((s && s->family) ? s->family : "Digital Home Center"));
                         ^
   drivers/soc/realtek/chip.c:127:13: note: Assuming that condition 's' is =
not redundant
    if (likely(s && s->get_name)) {
               ^
   drivers/soc/realtek/chip.c:138:23: note: Null pointer dereference
     ((s && s->family) ? s->family : "Digital Home Center"));
                         ^

# https://github.com/afaerber/linux/commit/3f4c278fe7b4caaa89ea7b9563c9aad1=
f2c1f278
git remote add afaerber https://github.com/afaerber/linux.git
git remote update afaerber
git checkout 3f4c278fe7b4caaa89ea7b9563c9aad1f2c1f278
vim +/s +138 drivers/soc/realtek/chip.c

3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15   91  =

3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15   92  static int rtd_soc_prob=
e(struct platform_device *pdev)
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15   93  {
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15   94  	const struct rtd_soc *=
s;
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15   95  	struct soc_device_attr=
ibute *soc_dev_attr;
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15   96  	struct soc_device *soc=
_dev;
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15   97  	struct device_node *no=
de;
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15   98  	struct regmap *regmap;
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15   99  	u16 chip_id, chip_rev;
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  100  	unsigned int val;
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  101  	int ret;
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  102  =

3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  103  	regmap =3D syscon_node=
_to_regmap(pdev->dev.of_node->parent);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  104  	if (IS_ERR(regmap))
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  105  		return PTR_ERR(regmap=
);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  106  =

3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  107  	ret =3D regmap_read(re=
gmap, REG_SB2_CHIP_ID, &val);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  108  	if (ret)
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  109  		return ret;
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  110  	chip_id =3D FIELD_GET(=
REG_SB2_CHIP_ID_CHIP_ID, val);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  111  =

3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  112  	ret =3D regmap_read(re=
gmap, REG_SB2_CHIP_INFO, &val);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  113  	if (ret)
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  114  		return ret;
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  115  	chip_rev =3D FIELD_GET=
(REG_SB2_CHIP_INFO_REVISE_ID, val);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  116  =

3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  117  	soc_dev_attr =3D kzall=
oc(sizeof(*soc_dev_attr), GFP_KERNEL);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  118  	if (!soc_dev_attr)
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  119  		return -ENOMEM;
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  120  =

3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  121  	node =3D of_find_node_=
by_path("/");
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  122  	of_property_read_strin=
g(node, "model", &soc_dev_attr->machine);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  123  	of_node_put(node);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  124  =

3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  125  	s =3D rtd_soc_by_chip_=
id(chip_id);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  126  =

3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  127  	if (likely(s && s->get=
_name)) {
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  128  		soc_dev_attr->soc_id =
=3D s->get_name(&pdev->dev, s);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  129  		if (IS_ERR(soc_dev_at=
tr->soc_id))
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  130  			return PTR_ERR(soc_d=
ev_attr->soc_id);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  131  	} else
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  132  		soc_dev_attr->soc_id =
=3D "unknown";
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  133  =

3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  134  	soc_dev_attr->revision=
 =3D rtd_soc_rev(s, chip_rev);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  135  =

3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  136  	soc_dev_attr->family =
=3D kasprintf(GFP_KERNEL, "Realtek %s",
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  137  		(s && s->codename) ? =
s->codename :
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15 @138  		((s && s->family) ? s=
->family : "Digital Home Center"));
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  139  =

3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  140  	soc_dev =3D soc_device=
_register(soc_dev_attr);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  141  	if (IS_ERR(soc_dev)) {
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  142  		kfree(soc_dev_attr->f=
amily);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  143  		kfree(soc_dev_attr);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  144  		return PTR_ERR(soc_de=
v);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  145  	}
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  146  =

3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  147  	platform_set_drvdata(p=
dev, soc_dev);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  148  =

3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  149  	pr_info("%s %s (0x%04x=
) rev %s (0x%04x) detected\n",
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  150  		soc_dev_attr->family,=
 soc_dev_attr->soc_id, (u32)chip_id,
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  151  		soc_dev_attr->revisio=
n, (u32)chip_rev);
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  152  =

3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  153  	return 0;
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  154  }
3f4c278fe7b4ca Andreas F=C3=A4rber 2017-09-15  155  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3000839182806520083==--


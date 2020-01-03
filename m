Content-Type: multipart/mixed; boundary="===============8304561198690781834=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [phy:next 4/10] drivers/phy/phy-core.c:806 devm_of_phy_get() error: 'phy' dereferencing possible ERR_PTR()
Date: Fri, 03 Jan 2020 10:42:42 +0300
Message-ID: <20200103074242.GE3889@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8304561198690781834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.gi=
t next
head:   cbe4ab09f9ab1df0f82dd66d6552033a3af3e092
commit: 5253fe05bb47a2402f471d76078b3dcc66442d6c [4/10] phy: core: Add cons=
umer device link support

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/phy/phy-core.c:806 devm_of_phy_get() error: 'phy' dereferencing pos=
sible ERR_PTR()

# https://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git/comm=
it/?id=3D5253fe05bb47a2402f471d76078b3dcc66442d6c
git remote add phy https://git.kernel.org/pub/scm/linux/kernel/git/kishon/l=
inux-phy.git
git remote update phy
git checkout 5253fe05bb47a2402f471d76078b3dcc66442d6c
vim +/phy +806 drivers/phy/phy-core.c

b5d682f4eb76c9 Kamil Debski     2014-03-06  786  struct phy *devm_of_phy_ge=
t(struct device *dev, struct device_node *np,
b5d682f4eb76c9 Kamil Debski     2014-03-06  787  			    const char *con_id)
b5d682f4eb76c9 Kamil Debski     2014-03-06  788  {
b5d682f4eb76c9 Kamil Debski     2014-03-06  789  	struct phy **ptr, *phy;
5253fe05bb47a2 Alexandre Torgue 2019-11-04  790  	struct device_link *link;
b5d682f4eb76c9 Kamil Debski     2014-03-06  791  =

b5d682f4eb76c9 Kamil Debski     2014-03-06  792  	ptr =3D devres_alloc(devm=
_phy_release, sizeof(*ptr), GFP_KERNEL);
b5d682f4eb76c9 Kamil Debski     2014-03-06  793  	if (!ptr)
b5d682f4eb76c9 Kamil Debski     2014-03-06  794  		return ERR_PTR(-ENOMEM);
b5d682f4eb76c9 Kamil Debski     2014-03-06  795  =

b5d682f4eb76c9 Kamil Debski     2014-03-06  796  	phy =3D of_phy_get(np, co=
n_id);
b5d682f4eb76c9 Kamil Debski     2014-03-06  797  	if (!IS_ERR(phy)) {
b5d682f4eb76c9 Kamil Debski     2014-03-06  798  		*ptr =3D phy;
b5d682f4eb76c9 Kamil Debski     2014-03-06  799  		devres_add(dev, ptr);
b5d682f4eb76c9 Kamil Debski     2014-03-06  800  	} else {
b5d682f4eb76c9 Kamil Debski     2014-03-06  801  		devres_free(ptr);
b5d682f4eb76c9 Kamil Debski     2014-03-06  802  	}

This error handling was written as success handling so it was tricky to
read.  It would be better to say:

	phy =3D of_phy_get(np, con_id);
	if (IS_ERR(phy)) {
		devres_free(ptr);
		return phy;
	}

	*ptr =3D phy;
	devres_add(dev, ptr);
	link =3D device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);

b5d682f4eb76c9 Kamil Debski     2014-03-06  803  =

5253fe05bb47a2 Alexandre Torgue 2019-11-04  804  	link =3D device_link_add(=
dev, &phy->dev, DL_FLAG_STATELESS);
                                                                           =
          ^^^^^^^^
This will Oops.

5253fe05bb47a2 Alexandre Torgue 2019-11-04  805  	if (!link) {
5253fe05bb47a2 Alexandre Torgue 2019-11-04 @806  		dev_err(dev, "failed to =
create device link to %s\n",
5253fe05bb47a2 Alexandre Torgue 2019-11-04  807  			dev_name(phy->dev.paren=
t));
5253fe05bb47a2 Alexandre Torgue 2019-11-04  808  		return ERR_PTR(-EINVAL);
5253fe05bb47a2 Alexandre Torgue 2019-11-04  809  	}
5253fe05bb47a2 Alexandre Torgue 2019-11-04  810  =

b5d682f4eb76c9 Kamil Debski     2014-03-06  811  	return phy;
b5d682f4eb76c9 Kamil Debski     2014-03-06  812  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============8304561198690781834==--


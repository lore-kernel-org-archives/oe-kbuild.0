Content-Type: multipart/mixed; boundary="===============1739533999304525057=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [android-common:android-4.19 1/3] drivers/nvmem/core.c:462:8-12: ERROR: invalid reference to the index variable of the iterator on line 456
Date: Fri, 17 Apr 2020 10:44:42 +0800
Message-ID: <202004171032.Rj6y2GK2%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1739533999304525057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-4.19
head:   824a6c4cdf73abdd188b5a1e55fba7c63e18ea81
commit: 0fc0aae624eca1b9f56a962628c36b8b8829afa0 [1/3] BACKPORT: nvmem: res=
olve cells from DT at registration time
:::::: branch date: 7 weeks ago
:::::: commit date: 7 weeks ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/nvmem/core.c:462:8-12: ERROR: invalid reference to the index var=
iable of the iterator on line 456

git remote add android-common https://android.googlesource.com/kernel/common
git remote update android-common
git checkout 0fc0aae624eca1b9f56a962628c36b8b8829afa0
vim +462 drivers/nvmem/core.c

b6c217ab9be689 Andrew Lunn         2016-02-26  448  =

0fc0aae624eca1 Bartosz Golaszewski 2018-09-21  449  static struct nvmem_cel=
l *
0fc0aae624eca1 Bartosz Golaszewski 2018-09-21  450  nvmem_find_cell_by_inde=
x(struct nvmem_device *nvmem, int index)
0fc0aae624eca1 Bartosz Golaszewski 2018-09-21  451  {
0fc0aae624eca1 Bartosz Golaszewski 2018-09-21  452  	struct nvmem_cell *cel=
l =3D NULL;
0fc0aae624eca1 Bartosz Golaszewski 2018-09-21  453  	int i =3D 0;
0fc0aae624eca1 Bartosz Golaszewski 2018-09-21  454  =

0fc0aae624eca1 Bartosz Golaszewski 2018-09-21  455  	mutex_lock(&nvmem_mute=
x);
0fc0aae624eca1 Bartosz Golaszewski 2018-09-21 @456  	list_for_each_entry(ce=
ll, &nvmem_cells, node) {
0fc0aae624eca1 Bartosz Golaszewski 2018-09-21  457  		if (index =3D=3D i++)
0fc0aae624eca1 Bartosz Golaszewski 2018-09-21  458  			break;
0fc0aae624eca1 Bartosz Golaszewski 2018-09-21  459  	}
0fc0aae624eca1 Bartosz Golaszewski 2018-09-21  460  	mutex_unlock(&nvmem_mu=
tex);
0fc0aae624eca1 Bartosz Golaszewski 2018-09-21  461  =

0fc0aae624eca1 Bartosz Golaszewski 2018-09-21 @462  	return cell;
0fc0aae624eca1 Bartosz Golaszewski 2018-09-21  463  }
0fc0aae624eca1 Bartosz Golaszewski 2018-09-21  464  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1739533999304525057==--


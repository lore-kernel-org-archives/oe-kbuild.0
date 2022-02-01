Content-Type: multipart/mixed; boundary="===============5679567755022699966=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/marvell/prestera/prestera_span.c:95 prestera_span_get() warn: passing a valid pointer to 'PTR_ERR'
Date: Tue, 01 Feb 2022 15:11:41 +0800
Message-ID: <202202011558.YtVoKhiE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5679567755022699966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Serhiy Boiko <serhiy.boiko@plvision.eu>
CC: Volodymyr Mytnyk <vmytnyk@marvell.com>
CC: Vadym Kochan <vkochan@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: 13defa275eef90c07886dbd9e74e3dada8af7348 net: marvell: prestera: Ad=
d matchall support
date:   8 months ago
:::::: branch date: 2 days ago
:::::: commit date: 8 months ago
config: nios2-randconfig-m031-20220130 (https://download.01.org/0day-ci/arc=
hive/20220201/202202011558.YtVoKhiE-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/marvell/prestera/prestera_span.c:95 prestera_span_get(=
) warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +95 drivers/net/ethernet/marvell/prestera/prestera_span.c

13defa275eef90 Serhiy Boiko 2021-06-16   73  =

13defa275eef90 Serhiy Boiko 2021-06-16   74  static int prestera_span_get(s=
truct prestera_port *port, u8 *span_id)
13defa275eef90 Serhiy Boiko 2021-06-16   75  {
13defa275eef90 Serhiy Boiko 2021-06-16   76  	u8 new_span_id;
13defa275eef90 Serhiy Boiko 2021-06-16   77  	struct prestera_switch *sw =
=3D port->sw;
13defa275eef90 Serhiy Boiko 2021-06-16   78  	struct prestera_span_entry *e=
ntry;
13defa275eef90 Serhiy Boiko 2021-06-16   79  	int err;
13defa275eef90 Serhiy Boiko 2021-06-16   80  =

13defa275eef90 Serhiy Boiko 2021-06-16   81  	entry =3D prestera_span_entry=
_find_by_port(sw->span, port);
13defa275eef90 Serhiy Boiko 2021-06-16   82  	if (entry) {
13defa275eef90 Serhiy Boiko 2021-06-16   83  		refcount_inc(&entry->ref_cou=
nt);
13defa275eef90 Serhiy Boiko 2021-06-16   84  		*span_id =3D entry->id;
13defa275eef90 Serhiy Boiko 2021-06-16   85  		return 0;
13defa275eef90 Serhiy Boiko 2021-06-16   86  	}
13defa275eef90 Serhiy Boiko 2021-06-16   87  =

13defa275eef90 Serhiy Boiko 2021-06-16   88  	err =3D prestera_hw_span_get(=
port, &new_span_id);
13defa275eef90 Serhiy Boiko 2021-06-16   89  	if (err)
13defa275eef90 Serhiy Boiko 2021-06-16   90  		return err;
13defa275eef90 Serhiy Boiko 2021-06-16   91  =

13defa275eef90 Serhiy Boiko 2021-06-16   92  	entry =3D prestera_span_entry=
_create(port, new_span_id);
13defa275eef90 Serhiy Boiko 2021-06-16   93  	if (IS_ERR(entry)) {
13defa275eef90 Serhiy Boiko 2021-06-16   94  		prestera_hw_span_release(sw,=
 new_span_id);
13defa275eef90 Serhiy Boiko 2021-06-16  @95  		return PTR_ERR(entry);
13defa275eef90 Serhiy Boiko 2021-06-16   96  	}
13defa275eef90 Serhiy Boiko 2021-06-16   97  =

13defa275eef90 Serhiy Boiko 2021-06-16   98  	*span_id =3D new_span_id;
13defa275eef90 Serhiy Boiko 2021-06-16   99  	return 0;
13defa275eef90 Serhiy Boiko 2021-06-16  100  }
13defa275eef90 Serhiy Boiko 2021-06-16  101  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5679567755022699966==--


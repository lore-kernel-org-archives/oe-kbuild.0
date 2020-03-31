Content-Type: multipart/mixed; boundary="===============6380542947256540885=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [staging:staging-testing 278/280] drivers/most/core.c:1287 most_register_interface() error: we previously assumed 'iface' could be null (see line 1285)
Date: Tue, 31 Mar 2020 13:45:30 +0300
Message-ID: <20200331104530.GA2001@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6380542947256540885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Christian,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
staging-testing
head:   4a1a3e9bf5654e98bb48f5b074af17af96ded30d
commit: b276527539188f1f61c082ebef27803db93e536d [278/280] staging: most: m=
ove core files out of the staging area

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/most/core.c:1287 most_register_interface() error: we previously ass=
umed 'iface' could be null (see line 1285)

# https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit=
/?id=3Db276527539188f1f61c082ebef27803db93e536d
git remote add staging https://git.kernel.org/pub/scm/linux/kernel/git/greg=
kh/staging.git
git remote update staging
git checkout b276527539188f1f61c082ebef27803db93e536d
vim +/iface +1287 drivers/most/core.c

4d5f022f3a664e drivers/staging/most/core.c          Christian Gromm     201=
7-11-21  1279  int most_register_interface(struct most_interface *iface)
57562a72414ca3 drivers/staging/most/mostcore/core.c Christian Gromm     201=
5-07-24  1280  {
57562a72414ca3 drivers/staging/most/mostcore/core.c Christian Gromm     201=
5-07-24  1281  	unsigned int i;
57562a72414ca3 drivers/staging/most/mostcore/core.c Christian Gromm     201=
5-07-24  1282  	int id;
fcb7fad82e23f6 drivers/staging/most/core.c          Christian Gromm     201=
7-11-21  1283  	struct most_channel *c;
57562a72414ca3 drivers/staging/most/mostcore/core.c Christian Gromm     201=
5-07-24  1284  =

57562a72414ca3 drivers/staging/most/mostcore/core.c Christian Gromm     201=
5-07-24 @1285  	if (!iface || !iface->enqueue || !iface->configure ||
                                                                           =
                         ^^^^^^

57562a72414ca3 drivers/staging/most/mostcore/core.c Christian Gromm     201=
5-07-24  1286  	    !iface->poison_channel || (iface->num_channels > MAX_CH=
ANNELS)) {
6a82c775812944 drivers/staging/most/core.c          Christian Gromm     202=
0-01-23 @1287  		dev_err(iface->dev, "Bad interface or channel overflow\n");
                                                                           =
                                     ^^^^^^^^^^

Hopefully, we can just remove the NULL check?

4d5f022f3a664e drivers/staging/most/core.c          Christian Gromm     201=
7-11-21  1288  		return -EINVAL;
57562a72414ca3 drivers/staging/most/mostcore/core.c Christian Gromm     201=
5-07-24  1289  	}
57562a72414ca3 drivers/staging/most/mostcore/core.c Christian Gromm     201=
5-07-24  1290  =

57562a72414ca3 drivers/staging/most/mostcore/core.c Christian Gromm     201=
5-07-24  1291  	id =3D ida_simple_get(&mdev_id, 0, 0, GFP_KERNEL);
57562a72414ca3 drivers/staging/most/mostcore/core.c Christian Gromm     201=
5-07-24  1292  	if (id < 0) {

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6380542947256540885==--


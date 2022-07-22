Content-Type: multipart/mixed; boundary="===============4107196863599874921=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] USB: HCD: Fix URB giveback issue in tasklet function
Date: Fri, 22 Jul 2022 10:43:58 +0800
Message-ID: <202207221022.P7qys2lb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4107196863599874921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/u=
sb/core/hcd.c:1694:2: sparse: sparse: unused label 'restart'"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220721060833.4173-1-WeitaoWang-oc@zhaoxin.com>
References: <20220721060833.4173-1-WeitaoWang-oc@zhaoxin.com>
TO: Weitao Wang <WeitaoWang-oc@zhaoxin.com>
TO: stern(a)rowland.harvard.edu
TO: gregkh(a)linuxfoundation.org
TO: kishon(a)ti.com
TO: dianders(a)chromium.org
TO: s.shtylyov(a)omp.ru
TO: mka(a)chromium.org
TO: ming.lei(a)canonical.com
TO: linux-usb(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: tonywwang(a)zhaoxin.com
CC: weitaowang(a)zhaoxin.com
CC: CobeChen(a)zhaoxin.com
CC: TimGuo(a)zhaoxin.com

Hi Weitao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on linus/master v5.19-rc7 next-20220721]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Weitao-Wang/USB-HCD-=
Fix-URB-giveback-issue-in-tasklet-function/20220721-144208
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm-randconfig-s041-20220721 (https://download.01.org/0day-ci/archi=
ve/20220722/202207221022.P7qys2lb-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/302398ba5a76bb39957=
bad7a6a8cb9d0429cd43a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Weitao-Wang/USB-HCD-Fix-URB-giveba=
ck-issue-in-tasklet-function/20220721-144208
        git checkout 302398ba5a76bb39957bad7a6a8cb9d0429cd43a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm SHELL=3D/bin/bash drivers/usb/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/core/hcd.c:1694:2: sparse: sparse: unused label 'restart'

vim +/restart +1694 drivers/usb/core/hcd.c

94dfd7edfd5c9b6 Ming Lei    2013-07-03  1686  =

e71ea55a5b6f916 Allen Pais  2020-08-17  1687  static void usb_giveback_urb_=
bh(struct tasklet_struct *t)
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1688  {
e71ea55a5b6f916 Allen Pais  2020-08-17  1689  	struct giveback_urb_bh *bh =
=3D from_tasklet(bh, t, bh);
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1690  	struct list_head local_list;
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1691  =

94dfd7edfd5c9b6 Ming Lei    2013-07-03  1692  	spin_lock_irq(&bh->lock);
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1693  	bh->running =3D true;
94dfd7edfd5c9b6 Ming Lei    2013-07-03 @1694   restart:
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1695  	list_replace_init(&bh->head,=
 &local_list);
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1696  	spin_unlock_irq(&bh->lock);
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1697  =

94dfd7edfd5c9b6 Ming Lei    2013-07-03  1698  	while (!list_empty(&local_li=
st)) {
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1699  		struct urb *urb;
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1700  =

94dfd7edfd5c9b6 Ming Lei    2013-07-03  1701  		urb =3D list_entry(local_li=
st.next, struct urb, urb_list);
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1702  		list_del_init(&urb->urb_lis=
t);
c7ccde6eac6d3c4 Alan Stern  2013-09-03  1703  		bh->completing_ep =3D urb->=
ep;
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1704  		__usb_hcd_giveback_urb(urb);
c7ccde6eac6d3c4 Alan Stern  2013-09-03  1705  		bh->completing_ep =3D NULL;
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1706  	}
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1707  =

302398ba5a76bb3 Weitao Wang 2022-07-21  1708  	/* giveback new URBs next ti=
me to prevent this function from
302398ba5a76bb3 Weitao Wang 2022-07-21  1709  	 * not exiting for a long ti=
me.
302398ba5a76bb3 Weitao Wang 2022-07-21  1710  	 */
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1711  	spin_lock_irq(&bh->lock);
302398ba5a76bb3 Weitao Wang 2022-07-21  1712  	if (!list_empty(&bh->head)) {
302398ba5a76bb3 Weitao Wang 2022-07-21  1713  		if (bh->hi_priority)
302398ba5a76bb3 Weitao Wang 2022-07-21  1714  			tasklet_hi_schedule(&bh->b=
h);
302398ba5a76bb3 Weitao Wang 2022-07-21  1715  		else
302398ba5a76bb3 Weitao Wang 2022-07-21  1716  			tasklet_schedule(&bh->bh);
302398ba5a76bb3 Weitao Wang 2022-07-21  1717  	}
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1718  	bh->running =3D false;
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1719  	spin_unlock_irq(&bh->lock);
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1720  }
94dfd7edfd5c9b6 Ming Lei    2013-07-03  1721  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4107196863599874921==--


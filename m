Content-Type: multipart/mixed; boundary="===============2126199908166144428=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hv/channel.c:875:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 10 Jan 2022 12:44:39 +0800
Message-ID: <202201101236.11p9o4ph-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2126199908166144428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tianyu Lan <Tianyu.Lan@microsoft.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Michael Kelley <mikelley@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   df0cc57e057f18e44dac8e6c18aba47ab53202f9
commit: d4dccf353db80e209f262e3973c834e6e48ba9a9 Drivers: hv: vmbus: Mark v=
mbus ring buffer visible to host in Isolation VM
date:   2 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-c007-20220108 (https://download.01.org/0day-ci/ar=
chive/20220110/202201101236.11p9o4ph-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344=
d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd4dccf353db80e209f262e3973c834e6e48ba9a9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d4dccf353db80e209f262e3973c834e6e48ba9a9
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/ata/libata-eh.c:3231:19: warning: Value stored to 'ap' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ata_port *ap =3D ata_is_host_link(link) ? link->ap : NULL;
                            ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-eh.c:3231:19: note: Value stored to 'ap' during its i=
nitialization is never read
           struct ata_port *ap =3D ata_is_host_link(link) ? link->ap : NULL;
                            ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-eh.c:3232:25: warning: Value stored to 'ehc' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ata_eh_context *ehc =3D &link->eh_context;
                                  ^~~   ~~~~~~~~~~~~~~~~~
   drivers/ata/libata-eh.c:3232:25: note: Value stored to 'ehc' during its =
initialization is never read
           struct ata_eh_context *ehc =3D &link->eh_context;
                                  ^~~   ~~~~~~~~~~~~~~~~~
   drivers/ata/libata-eh.c:3234:22: warning: Value stored to 'old_policy' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           enum ata_lpm_policy old_policy =3D link->lpm_policy;
                               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~
   drivers/ata/libata-eh.c:3234:22: note: Value stored to 'old_policy' duri=
ng its initialization is never read
           enum ata_lpm_policy old_policy =3D link->lpm_policy;
                               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~
   drivers/ata/libata-eh.c:3235:7: warning: Value stored to 'no_dipm' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           bool no_dipm =3D link->ap->flags & ATA_FLAG_NO_DIPM;
                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-eh.c:3235:7: note: Value stored to 'no_dipm' during i=
ts initialization is never read
           bool no_dipm =3D link->ap->flags & ATA_FLAG_NO_DIPM;
                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/mtd/mtdcore.c:660:3: warning: Value stored to 'error' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   error =3D 0;
                   ^       ~
   drivers/mtd/mtdcore.c:660:3: note: Value stored to 'error' is never read
                   error =3D 0;
                   ^       ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/hv/channel.c:875:3: warning: Value stored to 'ret' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   drivers/hv/channel.c:875:3: note: Value stored to 'ret' is never read
                   ret =3D 0;
                   ^     ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/media/dvb-core/dvb_frontend.c:1582:3: warning: Value stored to '=
len' is never read [clang-analyzer-deadcode.DeadStores]
                   len =3D 1;
                   ^     ~
   drivers/media/dvb-core/dvb_frontend.c:1582:3: note: Value stored to 'len=
' is never read
                   len =3D 1;
                   ^     ~
   Suppressed 8 warnings (3 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mtd/nand/raw/nand_bbt.c:579:3: warning: Value stored to 'bbtbloc=
ks' is never read [clang-analyzer-deadcode.DeadStores]
                   bbtblocks =3D mtd->size >> this->bbt_erase_shift;
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_bbt.c:579:3: note: Value stored to 'bbtblocks'=
 is never read
                   bbtblocks =3D mtd->size >> this->bbt_erase_shift;
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/ret +875 drivers/hv/channel.c

edd9bbc1d934c2 drivers/hv/channel.c         Boqun Feng               2020-0=
9-16  823  =

3e189519557978 drivers/staging/hv/Channel.c Hank Janssen             2010-0=
3-04  824  /*
fff41b2e30c54c drivers/staging/hv/channel.c Haiyang Zhang            2010-1=
0-07  825   * vmbus_teardown_gpadl -Teardown the specified GPADL handle
f4266e342527b4 drivers/staging/hv/Channel.c Greg Kroah-Hartman       2009-0=
9-01  826   */
d4dccf353db80e drivers/hv/channel.c         Tianyu Lan               2021-1=
0-25  827  int vmbus_teardown_gpadl(struct vmbus_channel *channel, struct v=
mbus_gpadl *gpadl)
3e7ee4902fe699 drivers/staging/hv/Channel.c Hank Janssen             2009-0=
7-13  828  {
82250213d08689 drivers/staging/hv/Channel.c Greg Kroah-Hartman       2009-0=
8-26  829  	struct vmbus_channel_gpadl_teardown *msg;
aded7165f262e0 drivers/staging/hv/Channel.c Greg Kroah-Hartman       2009-0=
8-18  830  	struct vmbus_channel_msginfo *info;
dd0813b6f51b33 drivers/staging/hv/Channel.c Greg Kroah-Hartman       2009-0=
7-15  831  	unsigned long flags;
66be6530830573 drivers/hv/channel.c         K. Y. Srinivasan         2014-0=
8-27  832  	int ret;
3e7ee4902fe699 drivers/staging/hv/Channel.c Hank Janssen             2009-0=
7-13  833  =

e99c4afbee07e9 drivers/hv/channel.c         Andrea Parri (Microsoft  2020-1=
2-09  834) 	info =3D kzalloc(sizeof(*info) +
f4266e342527b4 drivers/staging/hv/Channel.c Greg Kroah-Hartman       2009-0=
9-01  835  		       sizeof(struct vmbus_channel_gpadl_teardown), GFP_KERNEL=
);
c3bf2e26b30f4e drivers/staging/hv/Channel.c Bill Pemberton           2010-0=
5-05  836  	if (!info)
c3bf2e26b30f4e drivers/staging/hv/Channel.c Bill Pemberton           2010-0=
5-05  837  		return -ENOMEM;
3e7ee4902fe699 drivers/staging/hv/Channel.c Hank Janssen             2009-0=
7-13  838  =

9568a1931cd206 drivers/staging/hv/channel.c K. Y. Srinivasan         2011-0=
5-10  839  	init_completion(&info->waitevent);
ccb61f8a99e6c2 drivers/hv/channel.c         K. Y. Srinivasan         2016-1=
2-22  840  	info->waiting_channel =3D channel;
3e7ee4902fe699 drivers/staging/hv/Channel.c Hank Janssen             2009-0=
7-13  841  =

c50f7fb28400bc drivers/staging/hv/channel.c Haiyang Zhang            2010-1=
1-08  842  	msg =3D (struct vmbus_channel_gpadl_teardown *)info->msg;
3e7ee4902fe699 drivers/staging/hv/Channel.c Hank Janssen             2009-0=
7-13  843  =

c50f7fb28400bc drivers/staging/hv/channel.c Haiyang Zhang            2010-1=
1-08  844  	msg->header.msgtype =3D CHANNELMSG_GPADL_TEARDOWN;
c50f7fb28400bc drivers/staging/hv/channel.c Haiyang Zhang            2010-1=
1-08  845  	msg->child_relid =3D channel->offermsg.child_relid;
d4dccf353db80e drivers/hv/channel.c         Tianyu Lan               2021-1=
0-25  846  	msg->gpadl =3D gpadl->gpadl_handle;
3e7ee4902fe699 drivers/staging/hv/Channel.c Hank Janssen             2009-0=
7-13  847  =

15b2f6479b5c52 drivers/staging/hv/channel.c Haiyang Zhang            2011-0=
1-26  848  	spin_lock_irqsave(&vmbus_connection.channelmsg_lock, flags);
c50f7fb28400bc drivers/staging/hv/channel.c Haiyang Zhang            2010-1=
1-08  849  	list_add_tail(&info->msglistentry,
da9fcb7260af0c drivers/staging/hv/channel.c Haiyang Zhang            2011-0=
1-26  850  		      &vmbus_connection.chn_msg_list);
15b2f6479b5c52 drivers/staging/hv/channel.c Haiyang Zhang            2011-0=
1-26  851  	spin_unlock_irqrestore(&vmbus_connection.channelmsg_lock, flags=
);
6f3d791f300618 drivers/hv/channel.c         K. Y. Srinivasan         2017-0=
8-11  852  =

6f3d791f300618 drivers/hv/channel.c         K. Y. Srinivasan         2017-0=
8-11  853  	if (channel->rescind)
6f3d791f300618 drivers/hv/channel.c         K. Y. Srinivasan         2017-0=
8-11  854  		goto post_msg_err;
6f3d791f300618 drivers/hv/channel.c         K. Y. Srinivasan         2017-0=
8-11  855  =

c0bb03924f1a80 drivers/hv/channel.c         Vitaly Kuznetsov         2016-1=
2-07  856  	ret =3D vmbus_post_msg(msg, sizeof(struct vmbus_channel_gpadl_t=
eardown),
c0bb03924f1a80 drivers/hv/channel.c         Vitaly Kuznetsov         2016-1=
2-07  857  			     true);
3e7ee4902fe699 drivers/staging/hv/Channel.c Hank Janssen             2009-0=
7-13  858  =

09cdf8f87c15db drivers/hv/channel.c         Vitaly Kuznetsov         2017-1=
0-29  859  	trace_vmbus_teardown_gpadl(msg, ret);
09cdf8f87c15db drivers/hv/channel.c         Vitaly Kuznetsov         2017-1=
0-29  860  =

66be6530830573 drivers/hv/channel.c         K. Y. Srinivasan         2014-0=
8-27  861  	if (ret)
66be6530830573 drivers/hv/channel.c         K. Y. Srinivasan         2014-0=
8-27  862  		goto post_msg_err;
66be6530830573 drivers/hv/channel.c         K. Y. Srinivasan         2014-0=
8-27  863  =

66be6530830573 drivers/hv/channel.c         K. Y. Srinivasan         2014-0=
8-27  864  	wait_for_completion(&info->waitevent);
3e7ee4902fe699 drivers/staging/hv/Channel.c Hank Janssen             2009-0=
7-13  865  =

d4dccf353db80e drivers/hv/channel.c         Tianyu Lan               2021-1=
0-25  866  	gpadl->gpadl_handle =3D 0;
d4dccf353db80e drivers/hv/channel.c         Tianyu Lan               2021-1=
0-25  867  =

66be6530830573 drivers/hv/channel.c         K. Y. Srinivasan         2014-0=
8-27  868  post_msg_err:
5e030d5ce9d99a drivers/hv/channel.c         K. Y. Srinivasan         2017-0=
3-12  869  	/*
5e030d5ce9d99a drivers/hv/channel.c         K. Y. Srinivasan         2017-0=
3-12  870  	 * If the channel has been rescinded;
5e030d5ce9d99a drivers/hv/channel.c         K. Y. Srinivasan         2017-0=
3-12  871  	 * we will be awakened by the rescind
5e030d5ce9d99a drivers/hv/channel.c         K. Y. Srinivasan         2017-0=
3-12  872  	 * handler; set the error code to zero so we don't leak memory.
5e030d5ce9d99a drivers/hv/channel.c         K. Y. Srinivasan         2017-0=
3-12  873  	 */
5e030d5ce9d99a drivers/hv/channel.c         K. Y. Srinivasan         2017-0=
3-12  874  	if (channel->rescind)
5e030d5ce9d99a drivers/hv/channel.c         K. Y. Srinivasan         2017-0=
3-12 @875  		ret =3D 0;
5e030d5ce9d99a drivers/hv/channel.c         K. Y. Srinivasan         2017-0=
3-12  876  =

15b2f6479b5c52 drivers/staging/hv/channel.c Haiyang Zhang            2011-0=
1-26  877  	spin_lock_irqsave(&vmbus_connection.channelmsg_lock, flags);
c50f7fb28400bc drivers/staging/hv/channel.c Haiyang Zhang            2010-1=
1-08  878  	list_del(&info->msglistentry);
15b2f6479b5c52 drivers/staging/hv/channel.c Haiyang Zhang            2011-0=
1-26  879  	spin_unlock_irqrestore(&vmbus_connection.channelmsg_lock, flags=
);
3e7ee4902fe699 drivers/staging/hv/Channel.c Hank Janssen             2009-0=
7-13  880  =

8c69f52ab3d918 drivers/staging/hv/Channel.c Greg Kroah-Hartman       2009-0=
7-15  881  	kfree(info);
d4dccf353db80e drivers/hv/channel.c         Tianyu Lan               2021-1=
0-25  882  =

d4dccf353db80e drivers/hv/channel.c         Tianyu Lan               2021-1=
0-25  883  	ret =3D set_memory_encrypted((unsigned long)gpadl->buffer,
d4dccf353db80e drivers/hv/channel.c         Tianyu Lan               2021-1=
0-25  884  				   PFN_UP(gpadl->size));
d4dccf353db80e drivers/hv/channel.c         Tianyu Lan               2021-1=
0-25  885  	if (ret)
d4dccf353db80e drivers/hv/channel.c         Tianyu Lan               2021-1=
0-25  886  		pr_warn("Fail to set mem host visibility in GPADL teardown %d.=
\n", ret);
d4dccf353db80e drivers/hv/channel.c         Tianyu Lan               2021-1=
0-25  887  =

3e7ee4902fe699 drivers/staging/hv/Channel.c Hank Janssen             2009-0=
7-13  888  	return ret;
3e7ee4902fe699 drivers/staging/hv/Channel.c Hank Janssen             2009-0=
7-13  889  }
18726d7a60fdce drivers/staging/hv/channel.c Greg Kroah-Hartman       2010-1=
0-21  890  EXPORT_SYMBOL_GPL(vmbus_teardown_gpadl);
3e7ee4902fe699 drivers/staging/hv/Channel.c Hank Janssen             2009-0=
7-13  891  =


:::::: The code at line 875 was first introduced by commit
:::::: 5e030d5ce9d99a899b648413139ff65bab12b038 Drivers: hv: vmbus: Don't l=
eak memory when a channel is rescinded

:::::: TO: K. Y. Srinivasan <kys@microsoft.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2126199908166144428==--


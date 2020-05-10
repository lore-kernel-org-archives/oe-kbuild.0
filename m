Content-Type: multipart/mixed; boundary="===============0700269560185056923=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [linux-next:master 6095/7905] drivers/scsi/scsi_debug.c:2588:12: warning: Either the condition 'sip?&sip->macc_lck:&sdeb_fake_rw_lck' is redundant or there is possible null pointer dereference: sip. [nullPointerRedundantCheck]
Date: Sun, 10 May 2020 14:41:15 +0800
Message-ID: <202005101409.wAr1fg3d%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0700269560185056923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Douglas Gilbert <dgilbert@interlog.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   30e2206e11ce27ae910cc0dab21472429e400a87
commit: 87c715dcde633f4cc4690a24a240e838181e6a9d [6095/7905] scsi: scsi_deb=
ug: Add per_host_store option
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/scsi/scsi_debug.c:2588:12: warning: Either the condition 'sip?&s=
ip->macc_lck:&sdeb_fake_rw_lck' is redundant or there is possible null poin=
ter dereference: sip. [nullPointerRedundantCheck]
    u8 *fsp =3D sip->storep;
              ^
   drivers/scsi/scsi_debug.c:3483:28: note: Assuming that condition 'sip?&s=
ip->macc_lck:&sdeb_fake_rw_lck' is not redundant
    rwlock_t *macc_lckp =3D sip ? &sip->macc_lck : &sdeb_fake_rw_lck;
                              ^
   drivers/scsi/scsi_debug.c:3482:41: note: Assignment 'sip=3Ddevip2sip(dev=
ip)', assigned value is 0
    struct sdeb_store_info *sip =3D devip2sip(devip);
                                           ^
   drivers/scsi/scsi_debug.c:3527:25: note: Calling function 'comp_write_wo=
rker', 1st argument 'sip' value is 0
    if (!comp_write_worker(sip, lba, num, arr)) {
                           ^
   drivers/scsi/scsi_debug.c:2588:12: note: Null pointer dereference
    u8 *fsp =3D sip->storep;
              ^
>> drivers/scsi/scsi_debug.c:4726:5: warning: Variable 'j' is reassigned a =
value before the old one has been used. [redundantAssignment]
     j =3D 0;
       ^
   drivers/scsi/scsi_debug.c:4722:4: note: j is assigned
      ++j;
      ^
   drivers/scsi/scsi_debug.c:4726:5: note: j is overwritten
     j =3D 0;
       ^
>> drivers/scsi/scsi_debug.c:2588:12: warning: Null pointer dereference: si=
p [ctunullpointer]
    u8 *fsp =3D sip->storep;
              ^
   drivers/scsi/scsi_debug.c:3483:28: note: Assuming that condition 'sip?&s=
ip->macc_lck:&sdeb_fake_rw_lck' is not redundant
   =

                              ^
   drivers/scsi/scsi_debug.c:3482:41: note: Assignment 'sip=3Ddevip2sip(dev=
ip)', assigned value is 0
   =

                                           ^
   drivers/scsi/scsi_debug.c:3527:24: note: Calling function comp_write_wor=
ker, 1st argument is null
    if (!comp_write_worker(sip, lba, num, arr)) {
                          ^
   drivers/scsi/scsi_debug.c:2588:12: note: Dereferencing argument sip that=
 is null
    u8 *fsp =3D sip->storep;
              ^

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D87c715dcde633f4cc4690a24a240e838181e6a9d
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout 87c715dcde633f4cc4690a24a240e838181e6a9d
vim +2588 drivers/scsi/scsi_debug.c

87c715dcde633f Douglas Gilbert 2020-04-21  2577  =

87c715dcde633f Douglas Gilbert 2020-04-21  2578  /* If sip->storep+lba comp=
ares equal to arr(num), then copy top half of
87c715dcde633f Douglas Gilbert 2020-04-21  2579   * arr into sip->storep+lb=
a and return true. If comparison fails then
38d5c8336e60bf Douglas Gilbert 2014-11-24  2580   * return false. */
87c715dcde633f Douglas Gilbert 2020-04-21  2581  static bool comp_write_wor=
ker(struct sdeb_store_info *sip, u64 lba, u32 num,
87c715dcde633f Douglas Gilbert 2020-04-21  2582  			      const u8 *arr)
38d5c8336e60bf Douglas Gilbert 2014-11-24  2583  {
38d5c8336e60bf Douglas Gilbert 2014-11-24  2584  	bool res;
38d5c8336e60bf Douglas Gilbert 2014-11-24  2585  	u64 block, rest =3D 0;
38d5c8336e60bf Douglas Gilbert 2014-11-24  2586  	u32 store_blks =3D sdebug=
_store_sectors;
773642d95b8220 Douglas Gilbert 2016-04-25  2587  	u32 lb_size =3D sdebug_se=
ctor_size;
87c715dcde633f Douglas Gilbert 2020-04-21 @2588  	u8 *fsp =3D sip->storep;
38d5c8336e60bf Douglas Gilbert 2014-11-24  2589  =

38d5c8336e60bf Douglas Gilbert 2014-11-24  2590  	block =3D do_div(lba, sto=
re_blks);
38d5c8336e60bf Douglas Gilbert 2014-11-24  2591  	if (block + num > store_b=
lks)
38d5c8336e60bf Douglas Gilbert 2014-11-24  2592  		rest =3D block + num - s=
tore_blks;
38d5c8336e60bf Douglas Gilbert 2014-11-24  2593  =

87c715dcde633f Douglas Gilbert 2020-04-21  2594  	res =3D !memcmp(fsp + (bl=
ock * lb_size), arr, (num - rest) * lb_size);
38d5c8336e60bf Douglas Gilbert 2014-11-24  2595  	if (!res)
38d5c8336e60bf Douglas Gilbert 2014-11-24  2596  		return res;
38d5c8336e60bf Douglas Gilbert 2014-11-24  2597  	if (rest)
87c715dcde633f Douglas Gilbert 2020-04-21  2598  		res =3D memcmp(fsp, arr =
+ ((num - rest) * lb_size),
38d5c8336e60bf Douglas Gilbert 2014-11-24  2599  			     rest * lb_size);
38d5c8336e60bf Douglas Gilbert 2014-11-24  2600  	if (!res)
38d5c8336e60bf Douglas Gilbert 2014-11-24  2601  		return res;
38d5c8336e60bf Douglas Gilbert 2014-11-24  2602  	arr +=3D num * lb_size;
87c715dcde633f Douglas Gilbert 2020-04-21  2603  	memcpy(fsp + (block * lb_=
size), arr, (num - rest) * lb_size);
38d5c8336e60bf Douglas Gilbert 2014-11-24  2604  	if (rest)
87c715dcde633f Douglas Gilbert 2020-04-21  2605  		memcpy(fsp, arr + ((num =
- rest) * lb_size), rest * lb_size);
38d5c8336e60bf Douglas Gilbert 2014-11-24  2606  	return res;
38d5c8336e60bf Douglas Gilbert 2014-11-24  2607  }
38d5c8336e60bf Douglas Gilbert 2014-11-24  2608  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0700269560185056923==--


Content-Type: multipart/mixed; boundary="===============5230344028225370604=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: block/holder.c:155:36: warning: Uninitialized variable: holder->bdev [uninitvar]
Date: Sun, 03 Apr 2022 07:20:51 +0800
Message-ID: <202204030731.sNCaEAlA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5230344028225370604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>
CC: Mike Snitzer <snitzer@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: d626338735909bc2b2e7cafc332f44ed41cfdeee block: support delayed hol=
der registration
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   block/holder.c:10:72: warning: Parameter 'bdev' can be declared with con=
st [constParameter]
   static struct bd_holder_disk *bd_find_holder_disk(struct block_device *b=
dev,
                                                                          ^
>> block/holder.c:155:36: warning: Uninitialized variable: holder->bdev [un=
initvar]
     ret =3D __link_disk_holder(holder->bdev, disk);
                                      ^

vim +155 block/holder.c

d626338735909b Christoph Hellwig 2021-08-04  147  =

d626338735909b Christoph Hellwig 2021-08-04  148  int bd_register_pending_h=
olders(struct gendisk *disk)
d626338735909b Christoph Hellwig 2021-08-04  149  {
d626338735909b Christoph Hellwig 2021-08-04  150  	struct bd_holder_disk *h=
older;
d626338735909b Christoph Hellwig 2021-08-04  151  	int ret;
d626338735909b Christoph Hellwig 2021-08-04  152  =

d626338735909b Christoph Hellwig 2021-08-04  153  	mutex_lock(&disk->open_m=
utex);
d626338735909b Christoph Hellwig 2021-08-04  154  	list_for_each_entry(hold=
er, &disk->slave_bdevs, list) {
d626338735909b Christoph Hellwig 2021-08-04 @155  		ret =3D __link_disk_hol=
der(holder->bdev, disk);

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5230344028225370604==--


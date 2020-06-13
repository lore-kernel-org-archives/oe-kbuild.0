Content-Type: multipart/mixed; boundary="===============1356646590869271067=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/bnx2fc/bnx2fc_hwi.c:993:16: sparse: sparse: incorrect type in argument 1 (different base types)
Date: Sun, 14 Jun 2020 05:01:12 +0800
Message-ID: <202006140504.DbbYl4Uo%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1356646590869271067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Tony Luck <tony.luck@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   593bd5e5d3e245262c40c7dd2f5edbac705ff578
commit: 05933aac7b11911955de307a329dc2a7a14b7bd0 ia64: remove now unused ma=
chvec indirections
date:   10 months ago
:::::: branch date: 77 minutes ago
:::::: commit date: 10 months ago
config: ia64-randconfig-s031-20200614 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-250-g42323db3-dirty
        git checkout 05933aac7b11911955de307a329dc2a7a14b7bd0
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Dia64 CF=3D'-fdiagnostic-prefix -D__CHECK_EN=
DIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/scsi/bnx2fc/bnx2fc_hwi.c:209:40: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:212:27: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le16 [add=
ressable] [assigned] [usertype] rq_prod @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:212:27: sparse:     expected restricted=
 __le16 [addressable] [assigned] [usertype] rq_prod
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:212:27: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:221:37: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le16 [add=
ressable] [assigned] [usertype] tx_max_fc_pay_len @@     got unsigned short=
 [usertype] maxframe_size @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:221:37: sparse:     expected restricted=
 __le16 [addressable] [assigned] [usertype] tx_max_fc_pay_len
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:221:37: sparse:     got unsigned short =
[usertype] maxframe_size
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:223:30: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] cq_addr_lo @@     got unsigned int [usertyp=
e] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:223:30: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] cq_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:223:30: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:224:30: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] cq_addr_hi @@     got unsigned int [usertyp=
e] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:224:30: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] cq_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:224:30: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:226:33: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] xferq_addr_lo @@     got unsigned int [user=
type] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:226:33: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] xferq_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:226:33: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:227:33: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] xferq_addr_hi @@     got unsigned int [user=
type] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:227:33: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] xferq_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:227:33: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:229:35: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] conn_db_addr_lo @@     got unsigned int [us=
ertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:229:35: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] conn_db_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:229:35: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:230:35: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] conn_db_addr_hi @@     got unsigned int [us=
ertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:230:35: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] conn_db_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:230:35: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:239:28: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le16 [add=
ressable] [assigned] [usertype] vlan_tag @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:239:28: sparse:     expected restricted=
 __le16 [addressable] [assigned] [usertype] vlan_tag
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:239:28: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:241:28: sparse: sparse: invalid assignm=
ent: |=3D
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:241:28: sparse:    left side has type r=
estricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:241:28: sparse:    right side has type =
int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:264:38: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le16 [add=
ressable] [assigned] [usertype] tx_total_conc_seqs @@     got unsigned shor=
t [usertype] max_seq @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:264:38: sparse:     expected restricted=
 __le16 [addressable] [assigned] [usertype] tx_total_conc_seqs
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:264:38: sparse:     got unsigned short =
[usertype] max_seq
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:267:38: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le16 [add=
ressable] [assigned] [usertype] rx_max_fc_pay_len @@     got unsigned int [=
usertype] mfs @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:267:38: sparse:     expected restricted=
 __le16 [addressable] [assigned] [usertype] rx_max_fc_pay_len
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:267:38: sparse:     got unsigned int [u=
sertype] mfs
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:269:38: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le16 [add=
ressable] [assigned] [usertype] rx_total_conc_seqs @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:269:38: sparse:     expected restricted=
 __le16 [addressable] [assigned] [usertype] rx_total_conc_seqs
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:269:38: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:273:43: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] confq_first_pbe_addr_lo @@     got unsigned=
 long long [usertype] confq_dma @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:273:43: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] confq_first_pbe_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:273:43: sparse:     got unsigned long l=
ong [usertype] confq_dma
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:274:43: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] confq_first_pbe_addr_hi @@     got unsigned=
 int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:274:43: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] confq_first_pbe_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:274:43: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:332:31: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] lcq_addr_lo @@     got unsigned int [userty=
pe] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:332:31: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] lcq_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:332:31: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:333:31: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] lcq_addr_hi @@     got unsigned int [userty=
pe] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:333:31: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] lcq_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:333:31: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:335:42: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] confq_pbl_base_addr_lo @@     got unsigned =
int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:335:42: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] confq_pbl_base_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:335:42: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:336:42: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] confq_pbl_base_addr_hi @@     got unsigned =
int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:336:42: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] confq_pbl_base_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:336:42: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:410:29: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] context_id @@     got unsigned int [usertyp=
e] context_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:410:29: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:410:29: sparse:     got unsigned int [u=
sertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:411:26: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] conn_id @@     got unsigned int [usertype] =
fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:411:26: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:411:26: sparse:     got unsigned int [u=
sertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:469:32: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] context_id @@     got unsigned int [usertyp=
e] context_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:469:32: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:469:32: sparse:     got unsigned int [u=
sertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:470:29: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] conn_id @@     got unsigned int [usertype] =
fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:470:29: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:470:29: sparse:     got unsigned int [u=
sertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:504:32: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] context_id @@     got unsigned int [usertyp=
e] context_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:504:32: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:504:32: sparse:     got unsigned int [u=
sertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:505:29: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] conn_id @@     got unsigned int [usertype] =
fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:505:29: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:505:29: sparse:     got unsigned int [u=
sertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:613:28: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned int [usertype=
] fr_crc @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:613:28: sparse:     expected unsigned i=
nt [usertype] fr_crc
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:613:28: sparse:     got restricted __le=
32 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:697:21: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned short [userty=
pe] xid @@     got restricted __le16 [usertype] ox_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:697:21: sparse:     expected unsigned s=
hort [usertype] xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:697:21: sparse:     got restricted __le=
16 [usertype] ox_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:735:27: sparse: sparse: cast from restr=
icted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:736:26: sparse: sparse: cast from restr=
icted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:816:23: sparse: sparse: cast from restr=
icted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:816:23: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned short [userty=
pe] val @@     got restricted __le16 [usertype] ox_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:816:23: sparse:     expected unsigned s=
hort [usertype] val
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:816:23: sparse:     got restricted __le=
16 [usertype] ox_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:816:23: sparse: sparse: cast from restr=
icted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:816:23: sparse: sparse: cast from restr=
icted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:816:21: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned short [userty=
pe] xid @@     got restricted __be16 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:816:21: sparse:     expected unsigned s=
hort [usertype] xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:816:21: sparse:     got restricted __be=
16 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:830:27: sparse: sparse: cast from restr=
icted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:831:26: sparse: sparse: cast from restr=
icted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:899:43: sparse: sparse: restricted __le=
16 degrades to integer
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:914:45: sparse: sparse: restricted __le=
16 degrades to integer
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:990:33: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le16 [use=
rtype] doorbell_cq_cons @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:990:33: sparse:     expected restricted=
 __le16 [usertype] doorbell_cq_cons
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:990:33: sparse:     got int
>> drivers/scsi/bnx2fc/bnx2fc_hwi.c:993:16: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] value @@     got restricted __le32 [usertype] @@
>> drivers/scsi/bnx2fc/bnx2fc_hwi.c:993:16: sparse:     expected unsigned i=
nt [usertype] value
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:993:16: sparse:     got restricted __le=
32 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1057:22: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected unsigned short [usert=
ype] wqe @@     got restricted __le16 [usertype] wqe @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1057:22: sparse:     expected unsigned =
short [usertype] wqe
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1057:22: sparse:     got restricted __l=
e16 [usertype] wqe
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1223:17: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected unsigned int [usertyp=
e] conn_id @@     got restricted __le32 [usertype] fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1223:17: sparse:     expected unsigned =
int [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1223:17: sparse:     got restricted __l=
e32 [usertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1339:53: sparse: sparse: incorrect type=
 in argument 2 (different base types) @@     expected unsigned int [usertyp=
e] err_code @@     got restricted __le32 [usertype] completion_status @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1339:53: sparse:     expected unsigned =
int [usertype] err_code
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1339:53: sparse:     got restricted __l=
e32 [usertype] completion_status
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1391:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le16 [us=
ertype] wqe @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1391:18: sparse:     expected restricte=
d __le16 [usertype] wqe
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1391:18: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1392:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1392:18: sparse:    left side has type =
restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1392:18: sparse:    right side has type=
 int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1410:16: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1410:16: sparse:     expected unsigned =
int [usertype] value
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1410:16: sparse:     got restricted __l=
e32 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1497:46: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le32 [us=
ertype] init_flags @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1497:46: sparse:     expected restricte=
d __le32 [usertype] init_flags
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1497:46: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1499:46: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le32 [us=
ertype] init_flags @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1499:46: sparse:     expected restricte=
d __le32 [usertype] init_flags
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1499:46: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1502:63: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le16 [us=
ertype] cleaned_task_id @@     got unsigned short [usertype] orig_xid @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1502:63: sparse:     expected restricte=
d __le16 [usertype] cleaned_task_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1502:63: sparse:     got unsigned short=
 [usertype] orig_xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1505:69: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le32 [us=
ertype] rolled_tx_data_offset @@     got unsigned int [usertype] offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1505:69: sparse:     expected restricte=
d __le32 [usertype] rolled_tx_data_offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1505:69: sparse:     got unsigned int [=
usertype] offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1511:35: sparse: sparse: restricted __l=
e16 degrades to integer
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1513:24: sparse: sparse: invalid assign=
ment: -=3D
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1513:24: sparse:    left side has type =
unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1513:24: sparse:    right side has type=
 restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1518:69: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le32 [us=
ertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1518:69: sparse:     expected restricte=
d __le32 [usertype] lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1518:69: sparse:     got unsigned int [=
usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1520:69: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le32 [us=
ertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1520:69: sparse:     expected restricte=
d __le32 [usertype] hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1520:69: sparse:     got unsigned int [=
usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1524:65: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le16 [us=
ertype] cur_sge_off @@     got unsigned int [usertype] offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1524:65: sparse:     expected restricte=
d __le16 [usertype] cur_sge_off
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1524:65: sparse:     got unsigned int [=
usertype] offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1537:46: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le32 [us=
ertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1537:46: sparse:     expected restricte=
d __le32 [usertype] lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1537:46: sparse:     got unsigned int [=
usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1538:46: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le32 [us=
ertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1538:46: sparse:     expected restricte=
d __le32 [usertype] hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1538:46: sparse:     got unsigned int [=
usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1540:42: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le16 [us=
ertype] cur_sge_off @@     got unsigned int [usertype] offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1540:42: sparse:     expected restricte=
d __le16 [usertype] cur_sge_off
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1540:42: sparse:     got unsigned int [=
usertype] offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1545:55: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le32 [us=
ertype] low_exp_ro @@     got unsigned int [usertype] orig_offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1545:55: sparse:     expected restricte=
d __le32 [usertype] low_exp_ro
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1545:55: sparse:     got unsigned int [=
usertype] orig_offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1546:56: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le32 [us=
ertype] high_exp_ro @@     got unsigned int [usertype] orig_offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1546:56: sparse:     expected restricte=
d __le32 [usertype] high_exp_ro
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1546:56: sparse:     got unsigned int [=
usertype] orig_offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1573:63: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le16 [us=
ertype] cleaned_task_id @@     got unsigned short [usertype] orig_xid @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1573:63: sparse:     expected restricte=
d __le16 [usertype] cleaned_task_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1573:63: sparse:     got unsigned short=
 [usertype] orig_xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1581:46: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le32 [us=
ertype] init_flags @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1581:46: sparse:     expected restricte=
d __le32 [usertype] init_flags
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1581:46: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1583:42: sparse: sparse: invalid assign=
ment: |=3D
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1583:42: sparse:    left side has type =
restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1583:42: sparse:    right side has type=
 int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1619:69: sparse: sparse: too many warni=
ngs

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D05933aac7b11911955de307a329dc2a7a14b7bd0
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 05933aac7b11911955de307a329dc2a7a14b7bd0
vim +993 drivers/scsi/bnx2fc/bnx2fc_hwi.c

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  625  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  626  static void bnx2fc_=
process_unsol_compl(struct bnx2fc_rport *tgt, u16 wqe)
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  627  {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  628  	u8 num_rq;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  629  	struct fcoe_err_re=
port_entry *err_entry;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  630  	unsigned char *rq_=
data;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  631  	unsigned char *buf=
 =3D NULL, *buf1;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  632  	int i;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  633  	u16 xid;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  634  	u32 frame_len, len;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  635  	struct bnx2fc_cmd =
*io_req =3D NULL;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  636  	struct fcoe_task_c=
tx_entry *task, *task_page;
aea71a024914e8 Bhanu Prakash Gollapudi 2011-07-26  637  	struct bnx2fc_inte=
rface *interface =3D tgt->port->priv;
aea71a024914e8 Bhanu Prakash Gollapudi 2011-07-26  638  	struct bnx2fc_hba =
*hba =3D interface->hba;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  639  	int task_idx, inde=
x;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  640  	int rc =3D 0;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  641  	u64 err_warn_bit_m=
ap;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  642  	u8 err_warn =3D 0x=
ff;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  643  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  644  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  645  	BNX2FC_TGT_DBG(tgt=
, "Entered UNSOL COMPLETION wqe =3D 0x%x\n", wqe);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  646  	switch (wqe & FCOE=
_UNSOLICITED_CQE_SUBTYPE) {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  647  	case FCOE_UNSOLICI=
TED_FRAME_CQE_TYPE:
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  648  		frame_len =3D (wq=
e & FCOE_UNSOLICITED_CQE_PKT_LEN) >>
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  649  			     FCOE_UNSOLI=
CITED_CQE_PKT_LEN_SHIFT;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  650  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  651  		num_rq =3D (frame=
_len + BNX2FC_RQ_BUF_SZ - 1) / BNX2FC_RQ_BUF_SZ;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  652  =

686959736a8543 Nithin Sujir            2011-03-17  653  		spin_lock_bh(&tgt=
->tgt_lock);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  654  		rq_data =3D (unsi=
gned char *)bnx2fc_get_next_rqe(tgt, num_rq);
686959736a8543 Nithin Sujir            2011-03-17  655  		spin_unlock_bh(&t=
gt->tgt_lock);
686959736a8543 Nithin Sujir            2011-03-17  656  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  657  		if (rq_data) {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  658  			buf =3D rq_data;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  659  		} else {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  660  			buf1 =3D buf =3D=
 kmalloc((num_rq * BNX2FC_RQ_BUF_SZ),
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  661  					      GFP_ATOM=
IC);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  662  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  663  			if (!buf1) {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  664  				BNX2FC_TGT_DBG(=
tgt, "Memory alloc failure\n");
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  665  				break;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  666  			}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  667  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  668  			for (i =3D 0; i =
< num_rq; i++) {
686959736a8543 Nithin Sujir            2011-03-17  669  				spin_lock_bh(&t=
gt->tgt_lock);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  670  				rq_data =3D (un=
signed char *)
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  671  					   bnx2fc_get_=
next_rqe(tgt, 1);
686959736a8543 Nithin Sujir            2011-03-17  672  				spin_unlock_bh(=
&tgt->tgt_lock);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  673  				len =3D BNX2FC_=
RQ_BUF_SZ;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  674  				memcpy(buf1, rq=
_data, len);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  675  				buf1 +=3D len;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  676  			}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  677  		}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  678  		bnx2fc_process_l2=
_frame_compl(tgt, buf, frame_len,
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  679  					      FC_XID_U=
NKNOWN);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  680  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  681  		if (buf !=3D rq_d=
ata)
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  682  			kfree(buf);
686959736a8543 Nithin Sujir            2011-03-17  683  		spin_lock_bh(&tgt=
->tgt_lock);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  684  		bnx2fc_return_rqe=
(tgt, num_rq);
686959736a8543 Nithin Sujir            2011-03-17  685  		spin_unlock_bh(&t=
gt->tgt_lock);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  686  		break;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  687  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  688  	case FCOE_ERROR_DE=
TECTION_CQE_TYPE:
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  689  		/*
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  690  		 * In case of err=
or reporting CQE a single RQ entry
686959736a8543 Nithin Sujir            2011-03-17  691  		 * is consumed.
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  692  		 */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  693  		spin_lock_bh(&tgt=
->tgt_lock);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  694  		num_rq =3D 1;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  695  		err_entry =3D (st=
ruct fcoe_err_report_entry *)
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  696  			     bnx2fc_get_=
next_rqe(tgt, 1);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  697  		xid =3D err_entry=
->fc_hdr.ox_id;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  698  		BNX2FC_TGT_DBG(tg=
t, "Unsol Error Frame OX_ID =3D 0x%x\n", xid);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  699  		BNX2FC_TGT_DBG(tg=
t, "err_warn_bitmap =3D %08x:%08x\n",
619c5cb6885b93 Vlad Zolotarov          2011-06-14  700  			err_entry->data.=
err_warn_bitmap_hi,
619c5cb6885b93 Vlad Zolotarov          2011-06-14  701  			err_entry->data.=
err_warn_bitmap_lo);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  702  		BNX2FC_TGT_DBG(tg=
t, "buf_offsets - tx =3D 0x%x, rx =3D 0x%x\n",
619c5cb6885b93 Vlad Zolotarov          2011-06-14  703  			err_entry->data.=
tx_buf_off, err_entry->data.rx_buf_off);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  704  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  705  =

0eb43b4bb081a1 Bhanu Prakash Gollapudi 2013-04-22  706  		if (xid > hba->ma=
x_xid) {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  707  			BNX2FC_TGT_DBG(t=
gt, "xid(0x%x) out of FW range\n",
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  708  				   xid);
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  709  			goto ret_err_rqe;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  710  		}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  711  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  712  		task_idx =3D xid =
/ BNX2FC_TASKS_PER_PAGE;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  713  		index =3D xid % B=
NX2FC_TASKS_PER_PAGE;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  714  		task_page =3D (st=
ruct fcoe_task_ctx_entry *)
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  715  					hba->task_ctx[=
task_idx];
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  716  		task =3D &(task_p=
age[index]);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  717  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  718  		io_req =3D (struc=
t bnx2fc_cmd *)hba->cmd_mgr->cmds[xid];
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  719  		if (!io_req)
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  720  			goto ret_err_rqe;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  721  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  722  		if (io_req->cmd_t=
ype !=3D BNX2FC_SCSI_CMD) {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  723  			printk(KERN_ERR =
PFX "err_warn: Not a SCSI cmd\n");
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  724  			goto ret_err_rqe;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  725  		}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  726  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  727  		if (test_and_clea=
r_bit(BNX2FC_FLAG_IO_CLEANUP,
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  728  				       &io_req-=
>req_flags)) {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  729  			BNX2FC_IO_DBG(io=
_req, "unsol_err: cleanup in "
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  730  					    "progress.=
. ignore unsol err\n");
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  731  			goto ret_err_rqe;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  732  		}
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  733  =

7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  734  		err_warn_bit_map =
=3D (u64)
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  735  			((u64)err_entry-=
>data.err_warn_bitmap_hi << 32) |
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  736  			(u64)err_entry->=
data.err_warn_bitmap_lo;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  737  		for (i =3D 0; i <=
 BNX2FC_NUM_ERR_BITS; i++) {
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  738  			if (err_warn_bit=
_map & (u64)((u64)1 << i)) {
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  739  				err_warn =3D i;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  740  				break;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  741  			}
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  742  		}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  743  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  744  		/*
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  745  		 * If ABTS is alr=
eady in progress, and FW error is
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  746  		 * received after=
 that, do not cancel the timeout_work
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  747  		 * and let the er=
ror recovery continue by explicitly
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  748  		 * logging out th=
e target, when the ABTS eventually
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  749  		 * times out.
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  750  		 */
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  751  		if (test_bit(BNX2=
FC_FLAG_ISSUE_ABTS, &io_req->req_flags)) {
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  752  			printk(KERN_ERR =
PFX "err_warn: io_req (0x%x) already "
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  753  					    "in ABTS p=
rocessing\n", xid);
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  754  			goto ret_err_rqe;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  755  		}
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  756  		BNX2FC_TGT_DBG(tg=
t, "err =3D 0x%x\n", err_warn);
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  757  		if (tgt->dev_type=
 !=3D TYPE_TAPE)
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  758  			goto skip_rec;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  759  		switch (err_warn)=
 {
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  760  		case FCOE_ERROR_C=
ODE_REC_TOV_TIMER_EXPIRATION:
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  761  		case FCOE_ERROR_C=
ODE_DATA_OOO_RO:
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  762  		case FCOE_ERROR_C=
ODE_COMMON_INCORRECT_SEQ_CNT:
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  763  		case FCOE_ERROR_C=
ODE_DATA_SOFI3_SEQ_ACTIVE_SET:
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  764  		case FCOE_ERROR_C=
ODE_FCP_RSP_OPENED_SEQ:
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  765  		case FCOE_ERROR_C=
ODE_DATA_SOFN_SEQ_ACTIVE_RESET:
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  766  			BNX2FC_TGT_DBG(t=
gt, "REC TOV popped for xid - 0x%x\n",
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  767  				   xid);
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  768  			memcpy(&io_req->=
err_entry, err_entry,
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  769  			       sizeof(st=
ruct fcoe_err_report_entry));
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  770  			if (!test_bit(BN=
X2FC_FLAG_SRR_SENT,
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  771  				      &io_req->=
req_flags)) {
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  772  				spin_unlock_bh(=
&tgt->tgt_lock);
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  773  				rc =3D bnx2fc_s=
end_rec(io_req);
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  774  				spin_lock_bh(&t=
gt->tgt_lock);
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  775  =

7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  776  				if (rc)
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  777  					goto skip_rec;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  778  			} else
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  779  				printk(KERN_ERR=
 PFX "SRR in progress\n");
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  780  			goto ret_err_rqe;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  781  			break;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  782  		default:
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  783  			break;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  784  		}
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  785  =

7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  786  skip_rec:
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  787  		set_bit(BNX2FC_FL=
AG_ISSUE_ABTS, &io_req->req_flags);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  788  		/*
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  789  		 * Cancel the tim=
eout_work, as we received IO
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  790  		 * completion wit=
h FW error.
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  791  		 */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  792  		if (cancel_delaye=
d_work(&io_req->timeout_work))
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  793  			kref_put(&io_req=
->refcount, bnx2fc_cmd_release);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  794  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  795  		rc =3D bnx2fc_ini=
tiate_abts(io_req);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  796  		if (rc !=3D SUCCE=
SS) {
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  797  			printk(KERN_ERR =
PFX "err_warn: initiate_abts "
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  798  				"failed xid =3D=
 0x%x. issue cleanup\n",
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  799  				io_req->xid);
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  800  			bnx2fc_initiate_=
cleanup(io_req);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  801  		}
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  802  ret_err_rqe:
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  803  		bnx2fc_return_rqe=
(tgt, 1);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  804  		spin_unlock_bh(&t=
gt->tgt_lock);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  805  		break;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  806  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  807  	case FCOE_WARNING_=
DETECTION_CQE_TYPE:
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  808  		/*
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  809  		 *In case of warn=
ing reporting CQE a single RQ entry
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  810  		 * is consumes.
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  811  		 */
686959736a8543 Nithin Sujir            2011-03-17  812  		spin_lock_bh(&tgt=
->tgt_lock);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  813  		num_rq =3D 1;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  814  		err_entry =3D (st=
ruct fcoe_err_report_entry *)
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  815  			     bnx2fc_get_=
next_rqe(tgt, 1);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04 @816  		xid =3D cpu_to_be=
16(err_entry->fc_hdr.ox_id);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  817  		BNX2FC_TGT_DBG(tg=
t, "Unsol Warning Frame OX_ID =3D 0x%x\n", xid);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  818  		BNX2FC_TGT_DBG(tg=
t, "err_warn_bitmap =3D %08x:%08x",
619c5cb6885b93 Vlad Zolotarov          2011-06-14  819  			err_entry->data.=
err_warn_bitmap_hi,
619c5cb6885b93 Vlad Zolotarov          2011-06-14  820  			err_entry->data.=
err_warn_bitmap_lo);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  821  		BNX2FC_TGT_DBG(tg=
t, "buf_offsets - tx =3D 0x%x, rx =3D 0x%x",
619c5cb6885b93 Vlad Zolotarov          2011-06-14  822  			err_entry->data.=
tx_buf_off, err_entry->data.rx_buf_off);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  823  =

0eb43b4bb081a1 Bhanu Prakash Gollapudi 2013-04-22  824  		if (xid > hba->ma=
x_xid) {
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  825  			BNX2FC_TGT_DBG(t=
gt, "xid(0x%x) out of FW range\n", xid);
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  826  			goto ret_warn_rq=
e;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  827  		}
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  828  =

7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  829  		err_warn_bit_map =
=3D (u64)
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  830  			((u64)err_entry-=
>data.err_warn_bitmap_hi << 32) |
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  831  			(u64)err_entry->=
data.err_warn_bitmap_lo;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  832  		for (i =3D 0; i <=
 BNX2FC_NUM_ERR_BITS; i++) {
d0c0d902339249 Colin Ian King          2019-05-04  833  			if (err_warn_bit=
_map & ((u64)1 << i)) {
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  834  				err_warn =3D i;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  835  				break;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  836  			}
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  837  		}
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  838  		BNX2FC_TGT_DBG(tg=
t, "warn =3D 0x%x\n", err_warn);
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  839  =

7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  840  		task_idx =3D xid =
/ BNX2FC_TASKS_PER_PAGE;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  841  		index =3D xid % B=
NX2FC_TASKS_PER_PAGE;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  842  		task_page =3D (st=
ruct fcoe_task_ctx_entry *)
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  843  			     interface->=
hba->task_ctx[task_idx];
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  844  		task =3D &(task_p=
age[index]);
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  845  		io_req =3D (struc=
t bnx2fc_cmd *)hba->cmd_mgr->cmds[xid];
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  846  		if (!io_req)
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  847  			goto ret_warn_rq=
e;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  848  =

7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  849  		if (io_req->cmd_t=
ype !=3D BNX2FC_SCSI_CMD) {
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  850  			printk(KERN_ERR =
PFX "err_warn: Not a SCSI cmd\n");
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  851  			goto ret_warn_rq=
e;
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  852  		}
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  853  =

7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  854  		memcpy(&io_req->e=
rr_entry, err_entry,
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  855  		       sizeof(str=
uct fcoe_err_report_entry));
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  856  =

7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  857  		if (err_warn =3D=
=3D FCOE_ERROR_CODE_REC_TOV_TIMER_EXPIRATION)
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  858  			/* REC_TOV is no=
t a warning code */
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  859  			BUG_ON(1);
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  860  		else
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  861  			BNX2FC_TGT_DBG(t=
gt, "Unsolicited warning\n");
7b594769120b43 Bhanu Prakash Gollapudi 2011-07-27  862  ret_warn_rqe:
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  863  		bnx2fc_return_rqe=
(tgt, 1);
686959736a8543 Nithin Sujir            2011-03-17  864  		spin_unlock_bh(&t=
gt->tgt_lock);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  865  		break;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  866  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  867  	default:
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  868  		printk(KERN_ERR P=
FX "Unsol Compl: Invalid CQE Subtype\n");
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  869  		break;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  870  	}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  871  }
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  872  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  873  void bnx2fc_process=
_cq_compl(struct bnx2fc_rport *tgt, u16 wqe)
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  874  {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  875  	struct fcoe_task_c=
tx_entry *task;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  876  	struct fcoe_task_c=
tx_entry *task_page;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  877  	struct fcoe_port *=
port =3D tgt->port;
aea71a024914e8 Bhanu Prakash Gollapudi 2011-07-26  878  	struct bnx2fc_inte=
rface *interface =3D port->priv;
aea71a024914e8 Bhanu Prakash Gollapudi 2011-07-26  879  	struct bnx2fc_hba =
*hba =3D interface->hba;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  880  	struct bnx2fc_cmd =
*io_req;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  881  	int task_idx, inde=
x;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  882  	u16 xid;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  883  	u8  cmd_type;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  884  	u8 rx_state =3D 0;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  885  	u8 num_rq;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  886  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  887  	spin_lock_bh(&tgt-=
>tgt_lock);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  888  	xid =3D wqe & FCOE=
_PEND_WQ_CQE_TASK_ID;
0eb43b4bb081a1 Bhanu Prakash Gollapudi 2013-04-22  889  	if (xid >=3D hba->=
max_tasks) {
b2a554ff9ad5cd Bhanu Prakash Gollapudi 2011-06-27  890  		printk(KERN_ERR P=
FX "ERROR:xid out of range\n");
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  891  		spin_unlock_bh(&t=
gt->tgt_lock);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  892  		return;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  893  	}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  894  	task_idx =3D xid /=
 BNX2FC_TASKS_PER_PAGE;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  895  	index =3D xid % BN=
X2FC_TASKS_PER_PAGE;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  896  	task_page =3D (str=
uct fcoe_task_ctx_entry *)hba->task_ctx[task_idx];
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  897  	task =3D &(task_pa=
ge[index]);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  898  =

619c5cb6885b93 Vlad Zolotarov          2011-06-14  899  	num_rq =3D ((task-=
>rxwr_txrd.var_ctx.rx_flags &
619c5cb6885b93 Vlad Zolotarov          2011-06-14  900  		   FCOE_TCE_RX_WR=
_TX_RD_VAR_NUM_RQ_WQE) >>
619c5cb6885b93 Vlad Zolotarov          2011-06-14  901  		   FCOE_TCE_RX_WR=
_TX_RD_VAR_NUM_RQ_WQE_SHIFT);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  902  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  903  	io_req =3D (struct=
 bnx2fc_cmd *)hba->cmd_mgr->cmds[xid];
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  904  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  905  	if (io_req =3D=3D =
NULL) {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  906  		printk(KERN_ERR P=
FX "ERROR? cq_compl - io_req is NULL\n");
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  907  		spin_unlock_bh(&t=
gt->tgt_lock);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  908  		return;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  909  	}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  910  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  911  	/* Timestamp IO co=
mpletion time */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  912  	cmd_type =3D io_re=
q->cmd_type;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  913  =

619c5cb6885b93 Vlad Zolotarov          2011-06-14  914  	rx_state =3D ((tas=
k->rxwr_txrd.var_ctx.rx_flags &
619c5cb6885b93 Vlad Zolotarov          2011-06-14  915  		    FCOE_TCE_RX_W=
R_TX_RD_VAR_RX_STATE) >>
619c5cb6885b93 Vlad Zolotarov          2011-06-14  916  		    FCOE_TCE_RX_W=
R_TX_RD_VAR_RX_STATE_SHIFT);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  917  =

619c5cb6885b93 Vlad Zolotarov          2011-06-14  918  	/* Process other I=
O completion types */
619c5cb6885b93 Vlad Zolotarov          2011-06-14  919  	switch (cmd_type) {
619c5cb6885b93 Vlad Zolotarov          2011-06-14  920  	case BNX2FC_SCSI_C=
MD:
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  921  		if (rx_state =3D=
=3D FCOE_TASK_RX_STATE_COMPLETED) {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  922  			bnx2fc_process_s=
csi_cmd_compl(io_req, task, num_rq);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  923  			spin_unlock_bh(&=
tgt->tgt_lock);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  924  			return;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  925  		}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  926  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  927  		if (rx_state =3D=
=3D FCOE_TASK_RX_STATE_ABTS_COMPLETED)
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  928  			bnx2fc_process_a=
bts_compl(io_req, task, num_rq);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  929  		else if (rx_state=
 =3D=3D
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  930  			 FCOE_TASK_RX_ST=
ATE_EXCHANGE_CLEANUP_COMPLETED)
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  931  			bnx2fc_process_c=
leanup_compl(io_req, task, num_rq);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  932  		else
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  933  			printk(KERN_ERR =
PFX "Invalid rx state - %d\n",
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  934  				rx_state);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  935  		break;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  936  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  937  	case BNX2FC_TASK_M=
GMT_CMD:
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  938  		BNX2FC_IO_DBG(io_=
req, "Processing TM complete\n");
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  939  		bnx2fc_process_tm=
_compl(io_req, task, num_rq);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  940  		break;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  941  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  942  	case BNX2FC_ABTS:
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  943  		/*
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  944  		 * ABTS request r=
eceived by firmware. ABTS response
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  945  		 * will be delive=
red to the task belonging to the IO
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  946  		 * that was abort=
ed
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  947  		 */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  948  		BNX2FC_IO_DBG(io_=
req, "cq_compl- ABTS sent out by fw\n");
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  949  		kref_put(&io_req-=
>refcount, bnx2fc_cmd_release);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  950  		break;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  951  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  952  	case BNX2FC_ELS:
619c5cb6885b93 Vlad Zolotarov          2011-06-14  953  		if (rx_state =3D=
=3D FCOE_TASK_RX_STATE_COMPLETED)
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  954  			bnx2fc_process_e=
ls_compl(io_req, task, num_rq);
619c5cb6885b93 Vlad Zolotarov          2011-06-14  955  		else if (rx_state=
 =3D=3D FCOE_TASK_RX_STATE_ABTS_COMPLETED)
619c5cb6885b93 Vlad Zolotarov          2011-06-14  956  			bnx2fc_process_a=
bts_compl(io_req, task, num_rq);
619c5cb6885b93 Vlad Zolotarov          2011-06-14  957  		else if (rx_state=
 =3D=3D
619c5cb6885b93 Vlad Zolotarov          2011-06-14  958  			 FCOE_TASK_RX_ST=
ATE_EXCHANGE_CLEANUP_COMPLETED)
619c5cb6885b93 Vlad Zolotarov          2011-06-14  959  			bnx2fc_process_c=
leanup_compl(io_req, task, num_rq);
619c5cb6885b93 Vlad Zolotarov          2011-06-14  960  		else
619c5cb6885b93 Vlad Zolotarov          2011-06-14  961  			printk(KERN_ERR =
PFX "Invalid rx state =3D  %d\n",
619c5cb6885b93 Vlad Zolotarov          2011-06-14  962  				rx_state);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  963  		break;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  964  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  965  	case BNX2FC_CLEANU=
P:
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  966  		BNX2FC_IO_DBG(io_=
req, "cq_compl- cleanup resp rcvd\n");
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  967  		kref_put(&io_req-=
>refcount, bnx2fc_cmd_release);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  968  		break;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  969  =

6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  970  	case BNX2FC_SEQ_CL=
EANUP:
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  971  		BNX2FC_IO_DBG(io_=
req, "cq_compl(0x%x) - seq cleanup resp\n",
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  972  			      io_req->xi=
d);
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  973  		bnx2fc_process_se=
q_cleanup_compl(io_req, task, rx_state);
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  974  		kref_put(&io_req-=
>refcount, bnx2fc_cmd_release);
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  975  		break;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  976  =

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  977  	default:
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  978  		printk(KERN_ERR P=
FX "Invalid cmd_type %d\n", cmd_type);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  979  		break;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  980  	}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  981  	spin_unlock_bh(&tg=
t->tgt_lock);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  982  }
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  983  =

619c5cb6885b93 Vlad Zolotarov          2011-06-14  984  void bnx2fc_arm_cq(=
struct bnx2fc_rport *tgt)
619c5cb6885b93 Vlad Zolotarov          2011-06-14  985  {
619c5cb6885b93 Vlad Zolotarov          2011-06-14  986  	struct b577xx_fcoe=
_rx_doorbell *rx_db =3D &tgt->rx_db;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  987  	u32 msg;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  988  =

619c5cb6885b93 Vlad Zolotarov          2011-06-14  989  	wmb();
619c5cb6885b93 Vlad Zolotarov          2011-06-14  990  	rx_db->doorbell_cq=
_cons =3D tgt->cq_cons_idx | (tgt->cq_curr_toggle_bit <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  991  			FCOE_CQE_TOGGLE_=
BIT_SHIFT);
619c5cb6885b93 Vlad Zolotarov          2011-06-14  992  	msg =3D *((u32 *)r=
x_db);
619c5cb6885b93 Vlad Zolotarov          2011-06-14 @993  	writel(cpu_to_le32=
(msg), tgt->ctx_base);
619c5cb6885b93 Vlad Zolotarov          2011-06-14  994  =


:::::: The code at line 993 was first introduced by commit
:::::: 619c5cb6885b936c44ae1422ef805b69c6291485 New 7.0 FW: bnx2x, cnic, bn=
x2i, bnx2fc

:::::: TO: Vlad Zolotarov <vladz@broadcom.com>
:::::: CC: David S. Miller <davem@conan.davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1356646590869271067==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Dhr/D4/A0LYk0wEA
--===============1356646590869271067==--


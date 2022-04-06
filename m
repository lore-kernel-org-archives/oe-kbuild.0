Content-Type: multipart/mixed; boundary="===============6908065126760077340=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/3w-9xxx.c:1825:3: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Wed, 06 Apr 2022 13:15:03 +0800
Message-ID: <202204061332.KWYFjiYK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6908065126760077340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Bart Van Assche <bvanassche@acm.org>
CC: John Garry <john.garry@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: ce70fd9a551af7424a7dace2a1ba05a7de8eae27 scsi: core: Remove the cmd=
 field from struct scsi_request
date:   5 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220404 (https://download.01.org/0day-ci/arc=
hive/20220406/202204061332.KWYFjiYK-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dce70fd9a551af7424a7dace2a1ba05a7de8eae27
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ce70fd9a551af7424a7dace2a1ba05a7de8eae27
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/mmc/host/sdhci.c:883:6: note: Assuming 'data' is non-null, which=
 participates in a condition later
           if (!data) {
               ^~~~~
   drivers/mmc/host/sdhci.c:883:2: note: Taking false branch
           if (!data) {
           ^
   drivers/mmc/host/sdhci.c:887:7: note: Assuming field 'clock' is 0
                   if (host->clock && data->timeout_clks) {
                       ^~~~~~~~~~~
   drivers/mmc/host/sdhci.c:887:19: note: Left side of '&&' is false
                   if (host->clock && data->timeout_clks) {
                                   ^
   drivers/mmc/host/sdhci.c:917:19: note: Returning from 'sdhci_target_time=
out'
           target_timeout =3D sdhci_target_timeout(host, cmd, data);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci.c:920:6: note: 'data' is non-null
           if (data) {
               ^~~~
   drivers/mmc/host/sdhci.c:920:2: note: Taking true branch
           if (data) {
           ^
   drivers/mmc/host/sdhci.c:922:10: note: '?' condition is false
                   freq =3D mmc->actual_clock ? : host->clock;
                          ^
   drivers/mmc/host/sdhci.c:922:3: note: The value 0 is assigned to 'freq'
                   freq =3D mmc->actual_clock ? : host->clock;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci.c:924:3: note: '__base' initialized to 0
                   do_div(transfer_time, freq);
                   ^
   include/asm-generic/div64.h:46:2: note: expanded from macro 'do_div'
           uint32_t __base =3D (base);                               \
           ^~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci.c:924:3: note: Division by zero
                   do_div(transfer_time, freq);
                   ^
   include/asm-generic/div64.h:48:26: note: expanded from macro 'do_div'
           __rem =3D ((uint64_t)(n)) % __base;                       \
                   ~~~~~~~~~~~~~~~~^~~~~~~~
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (10 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (10 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   net/bluetooth/hci_core.c:890:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(di.name, hdev->name);
           ^~~~~~
   net/bluetooth/hci_core.c:890:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(di.name, hdev->name);
           ^~~~~~
   Suppressed 18 warnings (11 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (11 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   net/bluetooth/hci_event.c:3757:21: warning: Excessive padding in 'struct=
 hci_cc' (10 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   func, =

   op, =

   min_len, =

   max_len, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   static const struct hci_cc {
                ~~~~~~~^~~~~~~~
   net/bluetooth/hci_event.c:3757:21: note: Excessive padding in 'struct hc=
i_cc' (10 padding bytes, where 2 is optimal). Optimal fields order: func, o=
p, min_len, max_len, consider reordering the fields or adding explicit padd=
ing members
   static const struct hci_cc {
                ~~~~~~~^~~~~~~~
   net/bluetooth/hci_event.c:6651:21: warning: Excessive padding in 'struct=
 hci_ev' (11 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   , =

   min_len, =

   max_len, =

   req, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   static const struct hci_ev {
                ~~~~~~~^~~~~~~~
   net/bluetooth/hci_event.c:6651:21: note: Excessive padding in 'struct hc=
i_ev' (11 padding bytes, where 3 is optimal). Optimal fields order: , min_l=
en, max_len, req, consider reordering the fields or adding explicit padding=
 members
   static const struct hci_ev {
                ~~~~~~~^~~~~~~~
   Suppressed 18 warnings (11 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/scsi/3w-9xxx.c:720:3: warning: Value stored to 'timeout' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   timeout =3D wait_event_timeout(tw_dev->ioctl_wqueue, tw_=
dev->chrdev_request_id =3D=3D TW_IOCTL_CHRDEV_FREE, timeout);
                   ^
   drivers/scsi/3w-9xxx.c:720:3: note: Value stored to 'timeout' is never r=
ead
>> drivers/scsi/3w-9xxx.c:1825:3: warning: Null pointer passed as 2nd argum=
ent to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(command_packet->cdb, srb->cmnd, TW_MAX_CDB_LEN);
                   ^                           ~~~~~~~~~
   drivers/scsi/3w-9xxx.c:1810:6: note: Assuming the condition is false
           if (tw_dev->srb[request_id])
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/3w-9xxx.c:1810:2: note: Taking false branch
           if (tw_dev->srb[request_id])
           ^
   drivers/scsi/3w-9xxx.c:1824:6: note: Assuming 'cdb' is null
           if (!cdb)
               ^~~~
   drivers/scsi/3w-9xxx.c:1824:2: note: Taking true branch
           if (!cdb)
           ^
   drivers/scsi/3w-9xxx.c:1825:3: note: Null pointer passed as 2nd argument=
 to memory copy function
                   memcpy(command_packet->cdb, srb->cmnd, TW_MAX_CDB_LEN);
                   ^                           ~~~~~~~~~
   include/scsi/scsi_cmnd.h:187:9: warning: Dereference of null pointer [cl=
ang-analyzer-core.NullDereference]
           return cmd->sdb.table.nents;
                  ^
   drivers/scsi/3w-9xxx.c:1806:2: note: 'srb' initialized to a null pointer=
 value
           struct scsi_cmnd *srb =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/3w-9xxx.c:1810:6: note: Assuming the condition is false
           if (tw_dev->srb[request_id])
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/3w-9xxx.c:1810:2: note: Taking false branch
           if (tw_dev->srb[request_id])
           ^
   drivers/scsi/3w-9xxx.c:1824:6: note: Assuming 'cdb' is non-null
           if (!cdb)
               ^~~~
   drivers/scsi/3w-9xxx.c:1824:2: note: Taking false branch
           if (!cdb)
           ^
   drivers/scsi/3w-9xxx.c:1829:6: note: 'srb' is null
           if (srb) {
               ^~~
   drivers/scsi/3w-9xxx.c:1829:2: note: Taking false branch
           if (srb) {
           ^
   drivers/scsi/3w-9xxx.c:1841:6: note: Assuming 'sglistarg' is null
           if (!sglistarg) {
               ^~~~~~~~~~
   drivers/scsi/3w-9xxx.c:1841:2: note: Taking true branch
           if (!sglistarg) {
           ^
   drivers/scsi/3w-9xxx.c:1844:21: note: Passing null pointer value via 1st=
 parameter 'cmd'
                   if (scsi_sg_count(srb)) {
                                     ^~~
   drivers/scsi/3w-9xxx.c:1844:7: note: Calling 'scsi_sg_count'
                   if (scsi_sg_count(srb)) {
                       ^~~~~~~~~~~~~~~~~~
   include/scsi/scsi_cmnd.h:187:9: note: Dereference of null pointer
           return cmd->sdb.table.nents;
                  ^~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/scsi/3w-sas.c:789:3: warning: Value stored to 'timeout' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   timeout =3D wait_event_timeout(tw_dev->ioctl_wqueue, tw_=
dev->chrdev_request_id =3D=3D TW_IOCTL_CHRDEV_FREE, timeout);
                   ^
   drivers/scsi/3w-sas.c:789:3: note: Value stored to 'timeout' is never re=
ad
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/scsi/ipr.c:3124:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(driver_dump->location_entry.location, dev_name(&ioa_cfg->=
pdev->dev));
           ^~~~~~
   drivers/scsi/ipr.c:3124:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(driver_dump->location_entry.location, dev_name(&ioa_cfg->=
pdev->dev));
           ^~~~~~
   drivers/scsi/ipr.c:4796:2: warning: Access to field 'next' results in a =
dereference of a null pointer [clang-analyzer-core.NullDereference]
           list_for_each_entry(res, &ioa_cfg->used_res_q, queue) {
           ^
   include/linux/list.h:638:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:531:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/scsi/ipr.c:4871:6: note: Assuming field 'sis64' is not equal to 0
           if (ioa_cfg->sis64) {
               ^~~~~~~~~~~~~~
   drivers/scsi/ipr.c:4871:2: note: Taking true branch
           if (ioa_cfg->sis64) {
           ^
   drivers/scsi/ipr.c:4872:8: note: Calling 'ipr_find_starget'
                   if (!ipr_find_starget(starget)) {
                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ipr.c:4793:2: note: 'ioa_cfg' initialized to a null pointer=
 value
           struct ipr_ioa_cfg *ioa_cfg =3D (struct ipr_ioa_cfg *) shost->ho=
stdata;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ipr.c:4796:2: note: Access to field 'next' results in a der=
eference of a null pointer

vim +1825 drivers/scsi/3w-9xxx.c

f281233d3eba15 Jeff Garzik       2010-11-16  1796  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1797  /* This function hands s=
csi cdb's to the firmware */
09968e5049b4b9 Nathan Chancellor 2018-10-18  1798  static int twa_scsiop_ex=
ecute_scsi(TW_Device_Extension *tw_dev, int request_id,
09968e5049b4b9 Nathan Chancellor 2018-10-18  1799  				   unsigned char *cd=
b, int use_sg,
09968e5049b4b9 Nathan Chancellor 2018-10-18  1800  				   TW_SG_Entry *sgli=
starg)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1801  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1802  	TW_Command_Full *full_c=
ommand_packet;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1803  	TW_Command_Apache *comm=
and_packet;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1804  	u32 num_sectors =3D 0x0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1805  	int i, sg_count;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1806  	struct scsi_cmnd *srb =
=3D NULL;
ea7fb5344ad00a Lee Jones         2021-03-12  1807  	struct scatterlist *sg;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1808  	int retval =3D 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1809  =

ea7fb5344ad00a Lee Jones         2021-03-12  1810  	if (tw_dev->srb[request=
_id])
^1da177e4c3f41 Linus Torvalds    2005-04-16  1811  		srb =3D tw_dev->srb[re=
quest_id];
^1da177e4c3f41 Linus Torvalds    2005-04-16  1812  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1813  	/* Initialize command p=
acket */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1814  	full_command_packet =3D=
 tw_dev->command_packet_virt[request_id];
^1da177e4c3f41 Linus Torvalds    2005-04-16  1815  	full_command_packet->he=
ader.header_desc.size_header =3D 128;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1816  	full_command_packet->he=
ader.status_block.error =3D 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1817  	full_command_packet->he=
ader.status_block.severity__reserved =3D 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1818  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1819  	command_packet =3D &ful=
l_command_packet->command.newcommand;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1820  	command_packet->status =
=3D 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1821  	command_packet->opcode_=
_reserved =3D TW_OPRES_IN(0, TW_OP_EXECUTE_SCSI);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1822  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1823  	/* We forced 16 byte cd=
b use earlier */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1824  	if (!cdb)
^1da177e4c3f41 Linus Torvalds    2005-04-16 @1825  		memcpy(command_packet-=
>cdb, srb->cmnd, TW_MAX_CDB_LEN);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1826  	else
^1da177e4c3f41 Linus Torvalds    2005-04-16  1827  		memcpy(command_packet-=
>cdb, cdb, TW_MAX_CDB_LEN);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1828  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1829  	if (srb) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1830  		command_packet->unit =
=3D srb->device->id;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1831  		command_packet->reques=
t_id__lunl =3D
05f7f1b9ee8273 Samuel Holland    2021-04-27  1832  			TW_REQ_LUN_IN(srb->de=
vice->lun, request_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1833  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1834  		command_packet->reques=
t_id__lunl =3D
05f7f1b9ee8273 Samuel Holland    2021-04-27  1835  			TW_REQ_LUN_IN(0, requ=
est_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1836  		command_packet->unit =
=3D 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1837  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1838  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1839  	command_packet->sgl_off=
set =3D 16;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1840  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1841  	if (!sglistarg) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1842  		/* Map sglist from scs=
i layer to cmd packet */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1843  =

0debe01d3e26bb FUJITA Tomonori   2007-05-26  1844  		if (scsi_sg_count(srb)=
) {
15e3d5a285ab92 Christoph Hellwig 2015-10-03  1845  			if (!twa_command_mapp=
ed(srb)) {
035f5e06515a66 FUJITA Tomonori   2008-03-09  1846  				if (srb->sc_data_dir=
ection =3D=3D DMA_TO_DEVICE ||
035f5e06515a66 FUJITA Tomonori   2008-03-09  1847  				    srb->sc_data_dir=
ection =3D=3D DMA_BIDIRECTIONAL)
035f5e06515a66 FUJITA Tomonori   2008-03-09  1848  					scsi_sg_copy_to_buf=
fer(srb,
035f5e06515a66 FUJITA Tomonori   2008-03-09  1849  							       tw_dev->ge=
neric_buffer_virt[request_id],
035f5e06515a66 FUJITA Tomonori   2008-03-09  1850  							       TW_SECTOR_=
SIZE);
75913d9bb8328c Adam Radford      2006-03-15  1851  				command_packet->sg_l=
ist[0].address =3D TW_CPU_TO_SGL(tw_dev->generic_buffer_phys[request_id]);
75913d9bb8328c Adam Radford      2006-03-15  1852  				command_packet->sg_l=
ist[0].length =3D cpu_to_le32(TW_MIN_SGL_LENGTH);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1853  			} else {
118c855b5623f3 Christoph Hellwig 2015-04-23  1854  				sg_count =3D scsi_dm=
a_map(srb);
118c855b5623f3 Christoph Hellwig 2015-04-23  1855  				if (sg_count < 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1856  					goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1857  =

0debe01d3e26bb FUJITA Tomonori   2007-05-26  1858  				scsi_for_each_sg(srb=
, sg, sg_count, i) {
0debe01d3e26bb FUJITA Tomonori   2007-05-26  1859  					command_packet->sg_=
list[i].address =3D TW_CPU_TO_SGL(sg_dma_address(sg));
0debe01d3e26bb FUJITA Tomonori   2007-05-26  1860  					command_packet->sg_=
list[i].length =3D cpu_to_le32(sg_dma_len(sg));
75913d9bb8328c Adam Radford      2006-03-15  1861  					if (command_packet-=
>sg_list[i].address & TW_CPU_TO_SGL(TW_ALIGNMENT_9000_SGL)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1862  						TW_PRINTK(tw_dev->=
host, TW_DRIVER, 0x2e, "Found unaligned sgl address during execute scsi");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1863  						goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1864  					}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1865  				}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1866  			}
05f7f1b9ee8273 Samuel Holland    2021-04-27  1867  			command_packet->sgl_e=
ntries__lunh =3D TW_REQ_LUN_IN((srb->device->lun >> 4), scsi_sg_count(tw_de=
v->srb[request_id]));
^1da177e4c3f41 Linus Torvalds    2005-04-16  1868  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1869  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1870  		/* Internal cdb post */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1871  		for (i =3D 0; i < use_=
sg; i++) {
05f7f1b9ee8273 Samuel Holland    2021-04-27  1872  			command_packet->sg_li=
st[i].address =3D sglistarg[i].address;
05f7f1b9ee8273 Samuel Holland    2021-04-27  1873  			command_packet->sg_li=
st[i].length =3D sglistarg[i].length;
75913d9bb8328c Adam Radford      2006-03-15  1874  			if (command_packet->s=
g_list[i].address & TW_CPU_TO_SGL(TW_ALIGNMENT_9000_SGL)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1875  				TW_PRINTK(tw_dev->ho=
st, TW_DRIVER, 0x2f, "Found unaligned sgl address during internal post");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1876  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1877  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1878  		}
05f7f1b9ee8273 Samuel Holland    2021-04-27  1879  		command_packet->sgl_en=
tries__lunh =3D TW_REQ_LUN_IN(0, use_sg);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1880  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1881  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1882  	if (srb) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1883  		if (srb->cmnd[0] =3D=
=3D READ_6 || srb->cmnd[0] =3D=3D WRITE_6)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1884  			num_sectors =3D (u32)=
srb->cmnd[4];
^1da177e4c3f41 Linus Torvalds    2005-04-16  1885  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1886  		if (srb->cmnd[0] =3D=
=3D READ_10 || srb->cmnd[0] =3D=3D WRITE_10)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1887  			num_sectors =3D (u32)=
srb->cmnd[8] | ((u32)srb->cmnd[7] << 8);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1888  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1889  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1890  	/* Update sector statis=
tic */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1891  	tw_dev->sector_count =
=3D num_sectors;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1892  	if (tw_dev->sector_coun=
t > tw_dev->max_sector_count)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1893  		tw_dev->max_sector_cou=
nt =3D tw_dev->sector_count;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1894  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1895  	/* Update SG statistics=
 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1896  	if (srb) {
0debe01d3e26bb FUJITA Tomonori   2007-05-26  1897  		tw_dev->sgl_entries =
=3D scsi_sg_count(tw_dev->srb[request_id]);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1898  		if (tw_dev->sgl_entrie=
s > tw_dev->max_sgl_entries)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1899  			tw_dev->max_sgl_entri=
es =3D tw_dev->sgl_entries;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1900  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1901  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1902  	/* Now post the command=
 to the board */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1903  	if (srb) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1904  		retval =3D twa_post_co=
mmand_packet(tw_dev, request_id, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1905  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1906  		twa_post_command_packe=
t(tw_dev, request_id, 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1907  		retval =3D 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1908  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1909  out:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1910  	return retval;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1911  } /* End twa_scsiop_exec=
ute_scsi() */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1912  =


:::::: The code at line 1825 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6908065126760077340==--


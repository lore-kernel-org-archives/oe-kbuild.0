Content-Type: multipart/mixed; boundary="===============6741986170855075691=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9447/13468] drivers/net/wwan/t7xx/t7xx_pci.c:124:15: warning: Uninitialized variable: entity->id [uninitvar]
Date: Mon, 23 May 2022 05:50:05 +0800
Message-ID: <202205230548.ZIc4Y7be-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6741986170855075691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Haijun Liu <haijun.liu@mediatek.com>
CC: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
CC: Ricardo Martinez <ricardo.martinez@linux.intel.com>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   18ecd30af1a8402c162cca1bd58771c0e5be7815
commit: 46e8f49ed7b3063f51e28f3ea2084b3da29c1503 [9447/13468] net: wwan: t7=
xx: Introduce power management
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 46e8f49ed7b3063f51e28f3ea2084b3da29c1503
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/wwan/t7xx/t7xx_pci.c:124:15: warning: Uninitialized variable=
: entity->id [uninitvar]
     if (entity->id =3D=3D pm_entity->id) {
                 ^
   drivers/net/wwan/t7xx/t7xx_pci.c:141:15: warning: Uninitialized variable=
: entity->id [uninitvar]
     if (entity->id =3D=3D pm_entity->id) {
                 ^
>> drivers/net/wwan/t7xx/t7xx_pci.c:382:15: warning: Uninitialized variable=
: entity->resume_early [uninitvar]
     if (entity->resume_early)
                 ^
   drivers/net/wwan/t7xx/t7xx_pci.c:309:42: note: Assuming condition is fal=
se
    if (atomic_read(&t7xx_dev->md_pm_state) <=3D MTK_PM_INIT) {
                                            ^
   drivers/net/wwan/t7xx/t7xx_pci.c:382:15: note: Uninitialized variable: e=
ntity->resume_early
     if (entity->resume_early)
                 ^
--
>> kernel/bpf/ringbuf.c:370:38: warning: Parameter 'sample' can be declared=
 with const [constParameter]
   static void bpf_ringbuf_commit(void *sample, u64 flags, bool discard)
                                        ^
>> drivers/net/wwan/t7xx/t7xx_port_proxy.c:325:33: warning: Uninitialized v=
ariable: port_conf [uninitvar]
     if (queue->md_ctrl->hif_id =3D=3D port_conf->path_id &&
                                   ^
   drivers/net/wwan/t7xx/t7xx_port_proxy.c:323:48: note: Assignment 'port_c=
onf=3Dport->port_conf', assigned value is <Uninit>
     const struct t7xx_port_conf *port_conf =3D port->port_conf;
                                                  ^
   drivers/net/wwan/t7xx/t7xx_port_proxy.c:325:33: note: Uninitialized vari=
able: port_conf
     if (queue->md_ctrl->hif_id =3D=3D port_conf->path_id &&
                                   ^
>> drivers/net/wwan/t7xx/t7xx_port_proxy.c:327:11: warning: Uninitialized v=
ariables: port.port_conf, port.wwan_port, port.t7xx_dev, port.dev, port.usa=
ge_cnt, port.entry, port.queue_entry, port.rx_skb_list, port.port_update_lo=
ck, port.rx_wq, port.rx_length_th, port.chan_enable, port.thread [uninitvar]
      return port;
             ^
--
>> net/rxrpc/recvmsg.c:65:38: warning: syntax error [syntaxError]
        enum rxrpc_call_completion compl,
                                        ^
--
>> fs/splice.c:585:13: warning: Parameter 'ppos' can be declared with const=
 [constParameter]
       loff_t *ppos, size_t len, unsigned int flags,
               ^
>> net/tls/tls_sw.c:119:33: warning: Assignment of function parameter has n=
o effect outside the function. [uselessAssignmentArg]
                                   offset +=3D chunk;
                                   ^
>> fs/ext4/xattr.h:156:70: warning: Parameter 'save' can be declared with c=
onst [constParameter]
   static inline void ext4_write_unlock_xattr(struct inode *inode, int *sav=
e)
                                                                        ^
   fs/ext4/ext4.h:593:2: warning: Shifting signed 32-bit value by 31 bits i=
s implementation-defined behaviour [shiftTooManyBitsSigned]
    CHECK_FLAG_VALUE(RESERVED);
    ^
   fs/ext4/ext4.h:593:2: warning: Signed integer overflow for expression '1=
<<EXT4_INODE_RESERVED'. [integerOverflow]
    CHECK_FLAG_VALUE(RESERVED);
    ^
   fs/ext4/ext4_jbd2.h:402:9: warning: Variable '__ensure_end' is not assig=
ned a value. [unassignedVariable]
    return ext4_journal_ensure_credits_fn(handle, credits, credits,
           ^
>> fs/ext4/inode.c:5530:3: warning: Identical inner 'if' condition is alway=
s true. [identicalInnerCondition]
     ext4_std_error(inode->i_sb, error);
     ^
   fs/ext4/inode.c:5529:7: note: outer condition: error
    if  (error)
         ^
   fs/ext4/inode.c:5530:3: note: identical inner condition: error
     ext4_std_error(inode->i_sb, error);
     ^

vim +124 drivers/net/wwan/t7xx/t7xx_pci.c

46e8f49ed7b306 Haijun Liu 2022-05-06  117  =

46e8f49ed7b306 Haijun Liu 2022-05-06  118  int t7xx_pci_pm_entity_register(=
struct t7xx_pci_dev *t7xx_dev, struct md_pm_entity *pm_entity)
46e8f49ed7b306 Haijun Liu 2022-05-06  119  {
46e8f49ed7b306 Haijun Liu 2022-05-06  120  	struct md_pm_entity *entity;
46e8f49ed7b306 Haijun Liu 2022-05-06  121  =

46e8f49ed7b306 Haijun Liu 2022-05-06  122  	mutex_lock(&t7xx_dev->md_pm_ent=
ity_mtx);
46e8f49ed7b306 Haijun Liu 2022-05-06  123  	list_for_each_entry(entity, &t7=
xx_dev->md_pm_entities, entity) {
46e8f49ed7b306 Haijun Liu 2022-05-06 @124  		if (entity->id =3D=3D pm_entit=
y->id) {
46e8f49ed7b306 Haijun Liu 2022-05-06  125  			mutex_unlock(&t7xx_dev->md_pm=
_entity_mtx);
46e8f49ed7b306 Haijun Liu 2022-05-06  126  			return -EEXIST;
46e8f49ed7b306 Haijun Liu 2022-05-06  127  		}
46e8f49ed7b306 Haijun Liu 2022-05-06  128  	}
46e8f49ed7b306 Haijun Liu 2022-05-06  129  =

46e8f49ed7b306 Haijun Liu 2022-05-06  130  	list_add_tail(&pm_entity->entit=
y, &t7xx_dev->md_pm_entities);
46e8f49ed7b306 Haijun Liu 2022-05-06  131  	mutex_unlock(&t7xx_dev->md_pm_e=
ntity_mtx);
46e8f49ed7b306 Haijun Liu 2022-05-06  132  	return 0;
46e8f49ed7b306 Haijun Liu 2022-05-06  133  }
46e8f49ed7b306 Haijun Liu 2022-05-06  134  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6741986170855075691==--


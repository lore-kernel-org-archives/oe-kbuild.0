Content-Type: multipart/mixed; boundary="===============6509872851365033406=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vfio/vfio.c:1127:45: warning: Uninitialized variables: driver.ops, driver.vfio_next [uninitvar]
Date: Mon, 15 Aug 2022 11:56:52 +0800
Message-ID: <202208151137.lIUTqJU9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6509872851365033406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/v=
fio/vfio.c:1127:45: warning: Uninitialized variables: driver.ops, driver.vf=
io_next [uninitvar]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Kevin Tian <kevin.tian@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
commit: b00621603d050f77a6af9e81e32daeccfd246d6a vfio: factor out a vfio_io=
mmu_driver_allowed helper
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b00621603d050f77a6af9e81e32daeccfd246d6a
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:770:18: warning: Local variable 'iter' shadows outer v=
ariable [shadowVariable]
      struct rt_rq *iter =3D sched_rt_period_rt_rq(rt_b, i);
                    ^
   kernel/sched/rt.c:736:15: note: Shadowed declaration
    rt_rq_iter_t iter;
                 ^
   kernel/sched/rt.c:770:18: note: Shadow variable
      struct rt_rq *iter =3D sched_rt_period_rt_rq(rt_b, i);
                    ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/core/sock_reuseport.c:47:2: warning: Possible null pointer dereferen=
ce: reuse [nullPointer]
    reuse->socks[reuse->num_socks] =3D sk;
    ^
   net/core/sock_reuseport.c:291:28: note: Calling function '__reuseport_ad=
d_sock', 2nd argument 'old_reuse' value is 0
     __reuseport_add_sock(sk, old_reuse);
                              ^
   net/core/sock_reuseport.c:47:2: note: Null pointer dereference
    reuse->socks[reuse->num_socks] =3D sk;
    ^
   net/core/sock_reuseport.c:50:2: warning: Possible null pointer dereferen=
ce: reuse [nullPointer]
    reuse->num_socks++;
    ^
   net/core/sock_reuseport.c:291:28: note: Calling function '__reuseport_ad=
d_sock', 2nd argument 'old_reuse' value is 0
     __reuseport_add_sock(sk, old_reuse);
                              ^
   net/core/sock_reuseport.c:50:2: note: Null pointer dereference
    reuse->num_socks++;
    ^
   net/core/sock_reuseport.c:83:2: warning: Possible null pointer dereferen=
ce: reuse [nullPointer]
    reuse->socks[i] =3D reuse->socks[reuse->max_socks - reuse->num_closed_s=
ocks];
    ^
   net/core/sock_reuseport.c:290:38: note: Calling function '__reuseport_de=
tach_closed_sock', 2nd argument 'old_reuse' value is 0
     __reuseport_detach_closed_sock(sk, old_reuse);
                                        ^
   net/core/sock_reuseport.c:80:8: note: Assuming condition is Assuming con=
dition is false
    if (i =3D=3D -1)
          ^
   net/core/sock_reuseport.c:83:2: note: Null pointer dereference
    reuse->socks[i] =3D reuse->socks[reuse->max_socks - reuse->num_closed_s=
ocks];
    ^
   net/core/sock_reuseport.c:85:13: warning: Possible null pointer derefere=
nce: reuse [nullPointer]
    WRITE_ONCE(reuse->num_closed_socks, reuse->num_closed_socks - 1);
               ^
   net/core/sock_reuseport.c:290:38: note: Calling function '__reuseport_de=
tach_closed_sock', 2nd argument 'old_reuse' value is 0
     __reuseport_detach_closed_sock(sk, old_reuse);
                                        ^
   net/core/sock_reuseport.c:80:8: note: Assuming condition is Assuming con=
dition is false
    if (i =3D=3D -1)
          ^
   net/core/sock_reuseport.c:85:13: note: Null pointer dereference
    WRITE_ONCE(reuse->num_closed_socks, reuse->num_closed_socks - 1);
               ^
>> net/core/sock_reuseport.c:24:46: warning: Parameter 'sk' can be declared=
 with const [constParameter]
   static int reuseport_sock_index(struct sock *sk,
                                                ^
>> net/core/sock_reuseport.c:47:2: warning: Null pointer dereference: reuse=
 [ctunullpointer]
    reuse->socks[reuse->num_socks] =3D sk;
    ^
   net/core/sock_reuseport.c:291:23: note: Calling function __reuseport_add=
_sock, 2nd argument is null
     __reuseport_add_sock(sk, old_reuse);
                         ^
   net/core/sock_reuseport.c:47:2: note: Dereferencing argument reuse that =
is null
    reuse->socks[reuse->num_socks] =3D sk;
    ^
--
   drivers/vfio/vfio.c:542:66: warning: Parameter 'iommu_group' can be decl=
ared with const [constParameter]
   struct vfio_group *vfio_group_get_from_iommu(struct iommu_group *iommu_g=
roup)
                                                                    ^
   drivers/vfio/vfio.c:607:23: warning: Parameter 'dev' can be declared wit=
h const [constParameter]
          struct device *dev)
                         ^
   drivers/vfio/vfio.c:1808:56: warning: Parameter 'test_group' can be decl=
ared with const [constParameter]
   bool vfio_external_group_match_file(struct vfio_group *test_group,
                                                          ^
   drivers/vfio/vfio.c:295:12: warning: Uninitialized variable: tmp->ops [u=
ninitvar]
     if (tmp->ops =3D=3D ops) {
              ^
   drivers/vfio/vfio.c:286:6: note: Assuming condition is false
    if (!driver)
        ^
   drivers/vfio/vfio.c:295:12: note: Uninitialized variable: tmp->ops
     if (tmp->ops =3D=3D ops) {
              ^
   drivers/vfio/vfio.c:316:15: warning: Uninitialized variable: driver->ops=
 [uninitvar]
     if (driver->ops =3D=3D ops) {
                 ^
   drivers/vfio/vfio.c:548:14: warning: Uninitialized variable: group->iomm=
u_group [uninitvar]
     if (group->iommu_group =3D=3D iommu_group) {
                ^
   drivers/vfio/vfio.c:678:23: warning: Uninitialized variable: unbound->de=
v [uninitvar]
     if (dev =3D=3D unbound->dev) {
                         ^
>> drivers/vfio/vfio.c:1127:45: warning: Uninitialized variables: driver.op=
s, driver.vfio_next [uninitvar]
     if (!vfio_iommu_driver_allowed(container, driver))
                                               ^
   drivers/vfio/vfio.c:1118:41: note: Assuming condition is false
    if (list_empty(&container->group_list) || container->iommu_driver) {
                                           ^
   drivers/vfio/vfio.c:1118:41: note: Assuming condition is false
    if (list_empty(&container->group_list) || container->iommu_driver) {
                                           ^
   drivers/vfio/vfio.c:1127:45: note: Uninitialized variables: driver.ops, =
driver.vfio_next
     if (!vfio_iommu_driver_allowed(container, driver))
                                               ^
--
>> kernel/sched/sched.h:2019:67: warning: Parameter 'p' can be declared wit=
h const [constParameter]
   static inline int task_current(struct rq *rq, struct task_struct *p)
                                                                     ^
   kernel/sched/rt.c:786:10: warning: Same expression on both sides of '-=
=3D'. [duplicateExpression]
       want -=3D want;
            ^
>> kernel/sched/rt.c:130:9: warning: Possible null pointer dereference: rt_=
se [nullPointer]
    return rt_se->rt_rq;
           ^
   kernel/sched/rt.c:1328:33: note: Assignment 'back=3DNULL', assigned valu=
e is 0
    struct sched_rt_entity *back =3D NULL;
                                   ^
   kernel/sched/rt.c:1330:2: note: Assuming condition is false
    for_each_sched_rt_entity(rt_se) {
    ^
   kernel/sched/rt.c:1335:32: note: Calling function 'rt_rq_of_se', 1st arg=
ument 'back' value is 0
    dequeue_top_rt_rq(rt_rq_of_se(back));
                                  ^
   kernel/sched/rt.c:130:9: note: Null pointer dereference
    return rt_se->rt_rq;
           ^
>> kernel/sched/rt.c:130:9: warning: Null pointer dereference: rt_se [ctunu=
llpointer]
    return rt_se->rt_rq;
           ^
   kernel/sched/rt.c:1328:33: note: Assignment 'back=3DNULL', assigned valu=
e is 0
   =

                                   ^
   kernel/sched/rt.c:1330:2: note: Assuming condition is false
   =

    ^
   kernel/sched/rt.c:1335:31: note: Calling function rt_rq_of_se, 1st argum=
ent is null
    dequeue_top_rt_rq(rt_rq_of_se(back));
                                 ^
   kernel/sched/rt.c:130:9: note: Dereferencing argument rt_se that is null
    return rt_se->rt_rq;
           ^
   fs/btrfs/tree-log.h:47:28: warning: Uninitialized variables: ordered.fil=
e_offset, ordered.disk_bytenr, ordered.num_bytes, ordered.disk_num_bytes, o=
rdered.bytes_left, ordered.outstanding_isize, ordered.truncated_len, ordere=
d.flags, ordered.compress_type, ordered.qgroup_rsv, ordered.refs, ordered.i=
node, ordered.list, ordered.wait, ordered.rb_node, ordered.root_extent_list=
, ordered.work, ordered.completion, ordered.flush_work, ordered.work_list, =
ordered.physical, ordered.bdev [uninitvar]
     btrfs_put_ordered_extent(ordered);
                              ^
>> fs/btrfs/transaction.c:169:28: warning: Uninitialized variable: root->co=
mmit_root [uninitvar]
     free_extent_buffer(root->commit_root);
                              ^
>> fs/btrfs/transaction.c:219:30: warning: Uninitialized variable: cache [u=
ninitvar]
     if (btrfs_block_group_done(cache)) {
                                ^
   fs/btrfs/transaction.c:217:48: note: Assignment 'cache=3Dcaching_ctl->bl=
ock_group', assigned value is <Uninit>
     struct btrfs_block_group *cache =3D caching_ctl->block_group;
                                                  ^
   fs/btrfs/transaction.c:219:30: note: Uninitialized variable: cache
     if (btrfs_block_group_done(cache)) {
                                ^
>> fs/btrfs/transaction.c:891:11: warning: Uninitialized variable: t->state=
 [uninitvar]
      if (t->state >=3D TRANS_STATE_COMMIT_START) {
             ^
>> fs/btrfs/transaction.c:1808:40: warning: Uninitialized variables: pendin=
g.dentry, pending.dir, pending.root, pending.root_item, pending.snap, pendi=
ng.inherit, pending.path, pending.block_rsv, pending.error, pending.anon_de=
v, pending.readonly [uninitvar]
     ret =3D create_pending_snapshot(trans, pending);
                                          ^
>> kernel/bpf/core.c:1380:3: warning: Syntax Error: AST broken, binary oper=
ator '=3D' doesn't have two operands. [internalAstError]
     BPF_INSN_MAP(BPF_INSN_2_LBL, BPF_INSN_3_LBL),
     ^
--
   In file included from fs/btrfs/delayed-inode.c:
>> fs/btrfs/delayed-inode.c:1350:31: warning: Parameter 'disk_key' can be d=
eclared with const [constParameter]
          struct btrfs_disk_key *disk_key, u8 type,
                                 ^
>> fs/btrfs/delayed-inode.c:1580:13: warning: Uninitialized variable: curr-=
>key [uninitvar]
     if (curr->key.offset > index)
               ^
   fs/btrfs/delayed-inode.c:1616:13: warning: Uninitialized variable: curr-=
>key [uninitvar]
     if (curr->key.offset < ctx->pos) {
               ^
   fs/btrfs/delayed-inode.c:1605:16: note: Assuming condition is false
    if (list_empty(ins_list))
                  ^
   fs/btrfs/delayed-inode.c:1616:13: note: Uninitialized variable: curr->key
     if (curr->key.offset < ctx->pos) {
               ^
>> fs/btrfs/send.c:2067:12: warning: Uninitialized variable: cur->ino [unin=
itvar]
     if (cur->ino =3D=3D ino && cur->gen =3D=3D gen)
              ^
   fs/btrfs/send.c:2063:6: note: Assuming condition is false
    if (!nce_head)
        ^
   fs/btrfs/send.c:2067:12: note: Uninitialized variable: cur->ino
     if (cur->ino =3D=3D ino && cur->gen =3D=3D gen)
              ^
>> fs/btrfs/send.c:3110:17: warning: Uninitialized variables: cur.list, cur=
.name, cur.full_path, cur.dir, cur.dir_gen, cur.name_len [uninitvar]
     ret =3D dup_ref(cur, &pm->update_refs);
                   ^
   fs/btrfs/send.c:3087:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3087:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3087:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3087:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3087:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3087:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3110:17: note: Uninitialized variables: cur.list, cur.na=
me, cur.full_path, cur.dir, cur.dir_gen, cur.name_len
     ret =3D dup_ref(cur, &pm->update_refs);
                   ^

vim +1127 drivers/vfio/vfio.c

cba3345cc494ad Alex Williamson   2012-07-31  1101  =

cba3345cc494ad Alex Williamson   2012-07-31  1102  static long vfio_ioctl_s=
et_iommu(struct vfio_container *container,
cba3345cc494ad Alex Williamson   2012-07-31  1103  				 unsigned long arg)
cba3345cc494ad Alex Williamson   2012-07-31  1104  {
cba3345cc494ad Alex Williamson   2012-07-31  1105  	struct vfio_iommu_drive=
r *driver;
cba3345cc494ad Alex Williamson   2012-07-31  1106  	long ret =3D -ENODEV;
cba3345cc494ad Alex Williamson   2012-07-31  1107  =

9587f44aa69a4c Alex Williamson   2013-04-25  1108  	down_write(&container->=
group_lock);
cba3345cc494ad Alex Williamson   2012-07-31  1109  =

cba3345cc494ad Alex Williamson   2012-07-31  1110  	/*
cba3345cc494ad Alex Williamson   2012-07-31  1111  	 * The container is des=
igned to be an unprivileged interface while
cba3345cc494ad Alex Williamson   2012-07-31  1112  	 * the group can be ass=
igned to specific users.  Therefore, only by
cba3345cc494ad Alex Williamson   2012-07-31  1113  	 * adding a group to a =
container does the user get the privilege of
cba3345cc494ad Alex Williamson   2012-07-31  1114  	 * enabling the iommu, =
which may allocate finite resources.  There
cba3345cc494ad Alex Williamson   2012-07-31  1115  	 * is no unset_iommu, b=
ut by removing all the groups from a container,
cba3345cc494ad Alex Williamson   2012-07-31  1116  	 * the container is dep=
rivileged and returns to an unset state.
cba3345cc494ad Alex Williamson   2012-07-31  1117  	 */
cba3345cc494ad Alex Williamson   2012-07-31  1118  	if (list_empty(&contain=
er->group_list) || container->iommu_driver) {
9587f44aa69a4c Alex Williamson   2013-04-25  1119  		up_write(&container->g=
roup_lock);
cba3345cc494ad Alex Williamson   2012-07-31  1120  		return -EINVAL;
cba3345cc494ad Alex Williamson   2012-07-31  1121  	}
cba3345cc494ad Alex Williamson   2012-07-31  1122  =

cba3345cc494ad Alex Williamson   2012-07-31  1123  	mutex_lock(&vfio.iommu_=
drivers_lock);
ae5515d66362b9 Alex Williamson   2015-12-04  1124  	list_for_each_entry(dri=
ver, &vfio.iommu_drivers_list, vfio_next) {
cba3345cc494ad Alex Williamson   2012-07-31  1125  		void *data;
cba3345cc494ad Alex Williamson   2012-07-31  1126  =

b00621603d050f Christoph Hellwig 2021-09-24 @1127  		if (!vfio_iommu_driver=
_allowed(container, driver))
03a76b60f8ba27 Alex Williamson   2015-12-21  1128  			continue;
cba3345cc494ad Alex Williamson   2012-07-31  1129  		if (!try_module_get(dr=
iver->ops->owner))
cba3345cc494ad Alex Williamson   2012-07-31  1130  			continue;
cba3345cc494ad Alex Williamson   2012-07-31  1131  =

cba3345cc494ad Alex Williamson   2012-07-31  1132  		/*
cba3345cc494ad Alex Williamson   2012-07-31  1133  		 * The arg magic for S=
ET_IOMMU is the same as CHECK_EXTENSION,
cba3345cc494ad Alex Williamson   2012-07-31  1134  		 * so test which iommu=
 driver reported support for this
cba3345cc494ad Alex Williamson   2012-07-31  1135  		 * extension and call =
open on them.  We also pass them the
cba3345cc494ad Alex Williamson   2012-07-31  1136  		 * magic, allowing a s=
ingle driver to support multiple
cba3345cc494ad Alex Williamson   2012-07-31  1137  		 * interfaces if they'=
d like.
cba3345cc494ad Alex Williamson   2012-07-31  1138  		 */
cba3345cc494ad Alex Williamson   2012-07-31  1139  		if (driver->ops->ioctl=
(NULL, VFIO_CHECK_EXTENSION, arg) <=3D 0) {
cba3345cc494ad Alex Williamson   2012-07-31  1140  			module_put(driver->op=
s->owner);
cba3345cc494ad Alex Williamson   2012-07-31  1141  			continue;
cba3345cc494ad Alex Williamson   2012-07-31  1142  		}
cba3345cc494ad Alex Williamson   2012-07-31  1143  =

cba3345cc494ad Alex Williamson   2012-07-31  1144  		data =3D driver->ops->=
open(arg);
cba3345cc494ad Alex Williamson   2012-07-31  1145  		if (IS_ERR(data)) {
cba3345cc494ad Alex Williamson   2012-07-31  1146  			ret =3D PTR_ERR(data);
cba3345cc494ad Alex Williamson   2012-07-31  1147  			module_put(driver->op=
s->owner);
7c435b46c29a02 Alex Williamson   2016-02-22  1148  			continue;
cba3345cc494ad Alex Williamson   2012-07-31  1149  		}
cba3345cc494ad Alex Williamson   2012-07-31  1150  =

cba3345cc494ad Alex Williamson   2012-07-31  1151  		ret =3D __vfio_contain=
er_attach_groups(container, driver, data);
7c435b46c29a02 Alex Williamson   2016-02-22  1152  		if (ret) {
cba3345cc494ad Alex Williamson   2012-07-31  1153  			driver->ops->release(=
data);
cba3345cc494ad Alex Williamson   2012-07-31  1154  			module_put(driver->op=
s->owner);
7c435b46c29a02 Alex Williamson   2016-02-22  1155  			continue;
cba3345cc494ad Alex Williamson   2012-07-31  1156  		}
cba3345cc494ad Alex Williamson   2012-07-31  1157  =

7c435b46c29a02 Alex Williamson   2016-02-22  1158  		container->iommu_drive=
r =3D driver;
7c435b46c29a02 Alex Williamson   2016-02-22  1159  		container->iommu_data =
=3D data;
7c435b46c29a02 Alex Williamson   2016-02-22  1160  		break;
cba3345cc494ad Alex Williamson   2012-07-31  1161  	}
cba3345cc494ad Alex Williamson   2012-07-31  1162  =

cba3345cc494ad Alex Williamson   2012-07-31  1163  	mutex_unlock(&vfio.iomm=
u_drivers_lock);
9587f44aa69a4c Alex Williamson   2013-04-25  1164  	up_write(&container->gr=
oup_lock);
cba3345cc494ad Alex Williamson   2012-07-31  1165  =

cba3345cc494ad Alex Williamson   2012-07-31  1166  	return ret;
cba3345cc494ad Alex Williamson   2012-07-31  1167  }
cba3345cc494ad Alex Williamson   2012-07-31  1168  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6509872851365033406==--


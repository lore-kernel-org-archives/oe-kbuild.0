Content-Type: multipart/mixed; boundary="===============7974550280774976503=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/notify/fanotify/fanotify.c:391:32: warning: Either the condition '!file_name' is redundant or there is possible null pointer dereference: file_name.
Date: Tue, 16 Jun 2020 12:07:41 +0800
Message-ID: <202006161234.1Y2ojf6u%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7974550280774976503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a5dc8300df75e8b8384b4c82225f1e4a0b4d9b55
commit: cacfb956d46edc5d7a1165161bfc6ca3de9519d9 fanotify: record name info=
 for FAN_DIR_MODIFY event
date:   3 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/notify/fanotify/fanotify.c:391:32: warning: Either the condition '!fi=
le_name' is redundant or there is possible null pointer dereference: file_n=
ame. [nullPointerRedundantCheck]
     fne =3D kmalloc(sizeof(*fne) + file_name->len + 1, gfp);
                                  ^
   fs/notify/fanotify/fanotify.c:390:46: note: Assuming that condition '!fi=
le_name' is not redundant
    if (mask & FAN_DIR_MODIFY && !(WARN_ON_ONCE(!file_name))) {
                                                ^
   fs/notify/fanotify/fanotify.c:391:32: note: Null pointer dereference
     fne =3D kmalloc(sizeof(*fne) + file_name->len + 1, gfp);
                                  ^
   fs/notify/fanotify/fanotify.c:397:19: warning: Either the condition '!fi=
le_name' is redundant or there is possible null pointer dereference: file_n=
ame. [nullPointerRedundantCheck]
     fne->name_len =3D file_name->len;
                     ^
   fs/notify/fanotify/fanotify.c:390:46: note: Assuming that condition '!fi=
le_name' is not redundant
    if (mask & FAN_DIR_MODIFY && !(WARN_ON_ONCE(!file_name))) {
                                                ^
   fs/notify/fanotify/fanotify.c:397:19: note: Null pointer dereference
     fne->name_len =3D file_name->len;
                     ^
   fs/notify/fanotify/fanotify.c:398:21: warning: Either the condition '!fi=
le_name' is redundant or there is possible null pointer dereference: file_n=
ame. [nullPointerRedundantCheck]
     strcpy(fne->name, file_name->name);
                       ^
   fs/notify/fanotify/fanotify.c:390:46: note: Assuming that condition '!fi=
le_name' is not redundant
    if (mask & FAN_DIR_MODIFY && !(WARN_ON_ONCE(!file_name))) {
                                                ^
   fs/notify/fanotify/fanotify.c:398:21: note: Null pointer dereference
     strcpy(fne->name, file_name->name);
                       ^
   fs/notify/fanotify/fanotify.c:307:6: warning: Variable 'err' is reassign=
ed a value before the old one has been used. [redundantAssignment]
    err =3D -EINVAL;
        ^
   fs/notify/fanotify/fanotify.c:289:6: note: Variable 'err' is reassigned =
a value before the old one has been used.
    err =3D -ENOENT;
        ^
   fs/notify/fanotify/fanotify.c:307:6: note: Variable 'err' is reassigned =
a value before the old one has been used.
    err =3D -EINVAL;
        ^
   fs/notify/fanotify/fanotify.c:306:7: warning: Variable 'type' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    type =3D exportfs_encode_inode_fh(inode, buf, &dwords, NULL);
         ^
   fs/notify/fanotify/fanotify.c:290:7: note: Variable 'type' is reassigned=
 a value before the old one has been used.
    type =3D exportfs_encode_inode_fh(inode, NULL, &dwords, NULL);
         ^
   fs/notify/fanotify/fanotify.c:306:7: note: Variable 'type' is reassigned=
 a value before the old one has been used.
    type =3D exportfs_encode_inode_fh(inode, buf, &dwords, NULL);
         ^
   fs/notify/fanotify/fanotify.c:307:6: warning: Variable 'err' is reassign=
ed a value before the old one has been used. [redundantAssignment]
    err =3D -EINVAL;
        ^
   fs/notify/fanotify/fanotify.c:297:7: note: Variable 'err' is reassigned =
a value before the old one has been used.
     err =3D -ENOMEM;
         ^
   fs/notify/fanotify/fanotify.c:307:6: note: Variable 'err' is reassigned =
a value before the old one has been used.
    err =3D -EINVAL;
        ^
   fs/notify/fanotify/fanotify.c:563:6: warning: Variable 'ret' is reassign=
ed a value before the old one has been used. [redundantAssignment]
    ret =3D fsnotify_add_event(group, fsn_event, fanotify_merge);
        ^
   fs/notify/fanotify/fanotify.c:551:6: note: Variable 'ret' is reassigned =
a value before the old one has been used.
    ret =3D -ENOMEM;
        ^
   fs/notify/fanotify/fanotify.c:563:6: note: Variable 'ret' is reassigned =
a value before the old one has been used.
    ret =3D fsnotify_add_event(group, fsn_event, fanotify_merge);
        ^
--
   net/mptcp/options.c:172:4: warning: Assignment of function parameter has=
 no effect outside the function. Did you forget dereferencing it? [uselessA=
ssignmentPtrArg]
      ptr +=3D 2;
      ^
>> net/mptcp/options.c:352:3: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
     remaining -=3D map_size;
     ^
   net/mptcp/options.c:406:2: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
    remaining -=3D opt_size;
    ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dcacfb956d46edc5d7a1165161bfc6ca3de9519d9
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout cacfb956d46edc5d7a1165161bfc6ca3de9519d9
vim +391 fs/notify/fanotify/fanotify.c

83b535d2897d1d4 Amir Goldstein 2019-01-10  343  =

33913997d5c0678 Amir Goldstein 2019-01-10  344  struct fanotify_event *fano=
tify_alloc_event(struct fsnotify_group *group,
1f5eaa90010ed7c Jan Kara       2018-02-21  345  					    struct inode *inod=
e, u32 mask,
83b535d2897d1d4 Amir Goldstein 2019-01-10  346  					    const void *data, =
int data_type,
cacfb956d46edc5 Amir Goldstein 2020-03-19  347  					    const struct qstr =
*file_name,
77115225acc67d9 Amir Goldstein 2019-01-10  348  					    __kernel_fsid_t *f=
sid)
f083441ba86acb9 Jan Kara       2014-04-03  349  {
33913997d5c0678 Amir Goldstein 2019-01-10  350  	struct fanotify_event *eve=
nt =3D NULL;
7088f35720a55b9 Jan Kara       2020-03-24  351  	struct fanotify_fid_event =
*ffe =3D NULL;
cacfb956d46edc5 Amir Goldstein 2020-03-19  352  	struct fanotify_name_event=
 *fne =3D NULL;
d46eb14b735b119 Shakeel Butt   2018-08-17  353  	gfp_t gfp =3D GFP_KERNEL_A=
CCOUNT;
83b535d2897d1d4 Amir Goldstein 2019-01-10  354  	struct inode *id =3D fanot=
ify_fid_inode(inode, mask, data, data_type);
aa93bdc5500cc93 Amir Goldstein 2020-03-19  355  	const struct path *path =
=3D fsnotify_data_path(data, data_type);
1f5eaa90010ed7c Jan Kara       2018-02-21  356  =

1f5eaa90010ed7c Jan Kara       2018-02-21  357  	/*
1f5eaa90010ed7c Jan Kara       2018-02-21  358  	 * For queues with unlimit=
ed length lost events are not expected and
1f5eaa90010ed7c Jan Kara       2018-02-21  359  	 * can possibly have secur=
ity implications. Avoid losing events when
ec165450968b262 Shakeel Butt   2019-07-11  360  	 * memory is short. For th=
e limited size queues, avoid OOM killer in the
ec165450968b262 Shakeel Butt   2019-07-11  361  	 * target monitoring memcg=
 as it may have security repercussion.
1f5eaa90010ed7c Jan Kara       2018-02-21  362  	 */
1f5eaa90010ed7c Jan Kara       2018-02-21  363  	if (group->max_events =3D=
=3D UINT_MAX)
1f5eaa90010ed7c Jan Kara       2018-02-21  364  		gfp |=3D __GFP_NOFAIL;
ec165450968b262 Shakeel Butt   2019-07-11  365  	else
ec165450968b262 Shakeel Butt   2019-07-11  366  		gfp |=3D __GFP_RETRY_MAYF=
AIL;
f083441ba86acb9 Jan Kara       2014-04-03  367  =

d46eb14b735b119 Shakeel Butt   2018-08-17  368  	/* Whoever is interested i=
n the event, pays for the allocation. */
d46eb14b735b119 Shakeel Butt   2018-08-17  369  	memalloc_use_memcg(group->=
memcg);
d46eb14b735b119 Shakeel Butt   2018-08-17  370  =

6685df31255493c Miklos Szeredi 2017-10-30  371  	if (fanotify_is_perm_event=
(mask)) {
33913997d5c0678 Amir Goldstein 2019-01-10  372  		struct fanotify_perm_even=
t *pevent;
f083441ba86acb9 Jan Kara       2014-04-03  373  =

1f5eaa90010ed7c Jan Kara       2018-02-21  374  		pevent =3D kmem_cache_all=
oc(fanotify_perm_event_cachep, gfp);
f083441ba86acb9 Jan Kara       2014-04-03  375  		if (!pevent)
d46eb14b735b119 Shakeel Butt   2018-08-17  376  			goto out;
7088f35720a55b9 Jan Kara       2020-03-24  377  =

f083441ba86acb9 Jan Kara       2014-04-03  378  		event =3D &pevent->fae;
7088f35720a55b9 Jan Kara       2020-03-24  379  		event->type =3D FANOTIFY_=
EVENT_TYPE_PATH_PERM;
f083441ba86acb9 Jan Kara       2014-04-03  380  		pevent->response =3D 0;
40873284d7106fc Jan Kara       2019-01-08  381  		pevent->state =3D FAN_EVE=
NT_INIT;
f083441ba86acb9 Jan Kara       2014-04-03  382  		goto init;
f083441ba86acb9 Jan Kara       2014-04-03  383  	}
7088f35720a55b9 Jan Kara       2020-03-24  384  =

cacfb956d46edc5 Amir Goldstein 2020-03-19  385  	/*
cacfb956d46edc5 Amir Goldstein 2020-03-19  386  	 * For FAN_DIR_MODIFY even=
t, we report the fid of the directory and
cacfb956d46edc5 Amir Goldstein 2020-03-19  387  	 * the name of the modifie=
d entry.
cacfb956d46edc5 Amir Goldstein 2020-03-19  388  	 * Allocate an fanotify_na=
me_event struct and copy the name.
cacfb956d46edc5 Amir Goldstein 2020-03-19  389  	 */
cacfb956d46edc5 Amir Goldstein 2020-03-19  390  	if (mask & FAN_DIR_MODIFY =
&& !(WARN_ON_ONCE(!file_name))) {
cacfb956d46edc5 Amir Goldstein 2020-03-19 @391  		fne =3D kmalloc(sizeof(*f=
ne) + file_name->len + 1, gfp);
cacfb956d46edc5 Amir Goldstein 2020-03-19  392  		if (!fne)
cacfb956d46edc5 Amir Goldstein 2020-03-19  393  			goto out;
cacfb956d46edc5 Amir Goldstein 2020-03-19  394  =

cacfb956d46edc5 Amir Goldstein 2020-03-19  395  		event =3D &fne->fae;
cacfb956d46edc5 Amir Goldstein 2020-03-19  396  		event->type =3D FANOTIFY_=
EVENT_TYPE_FID_NAME;
cacfb956d46edc5 Amir Goldstein 2020-03-19  397  		fne->name_len =3D file_na=
me->len;
cacfb956d46edc5 Amir Goldstein 2020-03-19  398  		strcpy(fne->name, file_na=
me->name);
cacfb956d46edc5 Amir Goldstein 2020-03-19  399  		goto init;
cacfb956d46edc5 Amir Goldstein 2020-03-19  400  	}
cacfb956d46edc5 Amir Goldstein 2020-03-19  401  =

7088f35720a55b9 Jan Kara       2020-03-24  402  	if (FAN_GROUP_FLAG(group, =
FAN_REPORT_FID)) {
7088f35720a55b9 Jan Kara       2020-03-24  403  		ffe =3D kmem_cache_alloc(=
fanotify_fid_event_cachep, gfp);
7088f35720a55b9 Jan Kara       2020-03-24  404  		if (!ffe)
d46eb14b735b119 Shakeel Butt   2018-08-17  405  			goto out;
7088f35720a55b9 Jan Kara       2020-03-24  406  =

7088f35720a55b9 Jan Kara       2020-03-24  407  		event =3D &ffe->fae;
7088f35720a55b9 Jan Kara       2020-03-24  408  		event->type =3D FANOTIFY_=
EVENT_TYPE_FID;
7088f35720a55b9 Jan Kara       2020-03-24  409  	} else {
7088f35720a55b9 Jan Kara       2020-03-24  410  		struct fanotify_path_even=
t *pevent;
7088f35720a55b9 Jan Kara       2020-03-24  411  =

7088f35720a55b9 Jan Kara       2020-03-24  412  		pevent =3D kmem_cache_all=
oc(fanotify_path_event_cachep, gfp);
7088f35720a55b9 Jan Kara       2020-03-24  413  		if (!pevent)
7088f35720a55b9 Jan Kara       2020-03-24  414  			goto out;
7088f35720a55b9 Jan Kara       2020-03-24  415  =

7088f35720a55b9 Jan Kara       2020-03-24  416  		event =3D &pevent->fae;
7088f35720a55b9 Jan Kara       2020-03-24  417  		event->type =3D FANOTIFY_=
EVENT_TYPE_PATH;
7088f35720a55b9 Jan Kara       2020-03-24  418  	}
7088f35720a55b9 Jan Kara       2020-03-24  419  =

cacfb956d46edc5 Amir Goldstein 2020-03-19  420  init:
f367a62a7cad244 Amir Goldstein 2020-03-19  421  	/*
f367a62a7cad244 Amir Goldstein 2020-03-19  422  	 * Use the victim inode in=
stead of the watching inode as the id for
f367a62a7cad244 Amir Goldstein 2020-03-19  423  	 * event queue, so event r=
eported on parent is merged with event
f367a62a7cad244 Amir Goldstein 2020-03-19  424  	 * reported on child when =
both directory and child watches exist.
f367a62a7cad244 Amir Goldstein 2020-03-19  425  	 */
f367a62a7cad244 Amir Goldstein 2020-03-19  426  	fsnotify_init_event(&event=
->fse, (unsigned long)id);
a0a92d261f2922f Amir Goldstein 2019-01-10  427  	event->mask =3D mask;
d0a6a87e40da49c Amir Goldstein 2018-10-04  428  	if (FAN_GROUP_FLAG(group, =
FAN_REPORT_TID))
d0a6a87e40da49c Amir Goldstein 2018-10-04  429  		event->pid =3D get_pid(ta=
sk_pid(current));
d0a6a87e40da49c Amir Goldstein 2018-10-04  430  	else
d0a6a87e40da49c Amir Goldstein 2018-10-04  431  		event->pid =3D get_pid(ta=
sk_tgid(current));
7088f35720a55b9 Jan Kara       2020-03-24  432  =

cacfb956d46edc5 Amir Goldstein 2020-03-19  433  	if (fsid && fanotify_event=
_fsid(event))
cacfb956d46edc5 Amir Goldstein 2020-03-19  434  		*fanotify_event_fsid(even=
t) =3D *fsid;
cacfb956d46edc5 Amir Goldstein 2020-03-19  435  =

cacfb956d46edc5 Amir Goldstein 2020-03-19  436  	if (fanotify_event_object_=
fh(event))
cacfb956d46edc5 Amir Goldstein 2020-03-19  437  		fanotify_encode_fh(fanoti=
fy_event_object_fh(event), id, gfp);
cacfb956d46edc5 Amir Goldstein 2020-03-19  438  =

cacfb956d46edc5 Amir Goldstein 2020-03-19  439  	if (fanotify_event_dir_fh(=
event))
cacfb956d46edc5 Amir Goldstein 2020-03-19  440  		fanotify_encode_fh(fanoti=
fy_event_dir_fh(event), id, gfp);
cacfb956d46edc5 Amir Goldstein 2020-03-19  441  =

cacfb956d46edc5 Amir Goldstein 2020-03-19  442  	if (fanotify_event_has_pat=
h(event)) {
7088f35720a55b9 Jan Kara       2020-03-24  443  		struct path *p =3D fanoti=
fy_event_path(event);
7088f35720a55b9 Jan Kara       2020-03-24  444  =

7088f35720a55b9 Jan Kara       2020-03-24  445  		if (path) {
7088f35720a55b9 Jan Kara       2020-03-24  446  			*p =3D *path;
aa93bdc5500cc93 Amir Goldstein 2020-03-19  447  			path_get(path);
f083441ba86acb9 Jan Kara       2014-04-03  448  		} else {
7088f35720a55b9 Jan Kara       2020-03-24  449  			p->mnt =3D NULL;
7088f35720a55b9 Jan Kara       2020-03-24  450  			p->dentry =3D NULL;
7088f35720a55b9 Jan Kara       2020-03-24  451  		}
f083441ba86acb9 Jan Kara       2014-04-03  452  	}
d46eb14b735b119 Shakeel Butt   2018-08-17  453  out:
d46eb14b735b119 Shakeel Butt   2018-08-17  454  	memalloc_unuse_memcg();
f083441ba86acb9 Jan Kara       2014-04-03  455  	return event;
f083441ba86acb9 Jan Kara       2014-04-03  456  }
f083441ba86acb9 Jan Kara       2014-04-03  457  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7974550280774976503==--


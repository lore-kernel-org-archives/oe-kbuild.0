Content-Type: multipart/mixed; boundary="===============0158596723423278612=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [block:poll-multiple 25/25] fs/io_uring.c:5369:24: sparse: left side has type unsigned int
Date: Tue, 23 Feb 2021 19:57:11 +0800
Message-ID: <202102231904.D7crWnrJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0158596723423278612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it poll-multiple
head:   8e66ada09e9d0a91b360738c193bee581c1aa5ee
commit: 8e66ada09e9d0a91b360738c193bee581c1aa5ee [25/25] io_uring: add mult=
ishot mode for IORING_OP_POLL_ADD
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: riscv-randconfig-s032-20210223 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-229-g60c1f270-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block=
.git/commit/?id=3D8e66ada09e9d0a91b360738c193bee581c1aa5ee
        git remote add block https://git.kernel.org/pub/scm/linux/kernel/gi=
t/axboe/linux-block.git
        git fetch --no-tags block poll-multiple
        git checkout 8e66ada09e9d0a91b360738c193bee581c1aa5ee
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   fs/io_uring.c:2901:24: sparse: sparse: incorrect type in return expressi=
on (different address spaces) @@     expected void [noderef] __user * @@   =
  got struct io_buffer *[assigned] kbuf @@
   fs/io_uring.c:2901:24: sparse:     expected void [noderef] __user *
   fs/io_uring.c:2901:24: sparse:     got struct io_buffer *[assigned] kbuf
   fs/io_uring.c:4233:14: sparse: sparse: incorrect type in assignment (dif=
ferent address spaces) @@     expected struct file *[assigned] file @@     =
got struct file [noderef] __rcu * @@
   fs/io_uring.c:4233:14: sparse:     expected struct file *[assigned] file
   fs/io_uring.c:4233:14: sparse:     got struct file [noderef] __rcu *
   fs/io_uring.c:4842:72: sparse: sparse: incorrect type in argument 4 (dif=
ferent base types) @@     expected int mask @@     got restricted __poll_t =
[usertype] mask @@
   fs/io_uring.c:4842:72: sparse:     expected int mask
   fs/io_uring.c:4842:72: sparse:     got restricted __poll_t [usertype] ma=
sk
   fs/io_uring.c:4847:21: sparse: sparse: incorrect type in assignment (dif=
ferent base types) @@     expected unsigned int [usertype] result @@     go=
t restricted __poll_t [usertype] mask @@
   fs/io_uring.c:4847:21: sparse:     expected unsigned int [usertype] resu=
lt
   fs/io_uring.c:4847:21: sparse:     got restricted __poll_t [usertype] ma=
sk
   fs/io_uring.c:4873:29: sparse: sparse: incorrect type in assignment (dif=
ferent base types) @@     expected unsigned int [usertype] result @@     go=
t restricted __poll_t @@
   fs/io_uring.c:4873:29: sparse:     expected unsigned int [usertype] resu=
lt
   fs/io_uring.c:4873:29: sparse:     got restricted __poll_t
   fs/io_uring.c:4953:49: sparse: sparse: incorrect type in argument 2 (dif=
ferent base types) @@     expected restricted __poll_t [usertype] mask @@  =
   got unsigned int [usertype] result @@
   fs/io_uring.c:4953:49: sparse:     expected restricted __poll_t [usertyp=
e] mask
   fs/io_uring.c:4953:49: sparse:     got unsigned int [usertype] result
   fs/io_uring.c:5096:41: sparse: sparse: incorrect type in argument 4 (dif=
ferent base types) @@     expected int mask @@     got restricted __poll_t =
[usertype] @@
   fs/io_uring.c:5096:41: sparse:     expected int mask
   fs/io_uring.c:5096:41: sparse:     got restricted __poll_t [usertype]
   fs/io_uring.c:5184:22: sparse: sparse: invalid assignment: |=3D
   fs/io_uring.c:5184:22: sparse:    left side has type restricted __poll_t
   fs/io_uring.c:5184:22: sparse:    right side has type int
   fs/io_uring.c:5186:22: sparse: sparse: invalid assignment: |=3D
   fs/io_uring.c:5186:22: sparse:    left side has type restricted __poll_t
   fs/io_uring.c:5186:22: sparse:    right side has type int
   fs/io_uring.c:5191:22: sparse: sparse: invalid assignment: &=3D
   fs/io_uring.c:5191:22: sparse:    left side has type restricted __poll_t
   fs/io_uring.c:5191:22: sparse:    right side has type int
   fs/io_uring.c:5193:14: sparse: sparse: invalid assignment: |=3D
   fs/io_uring.c:5193:14: sparse:    left side has type restricted __poll_t
   fs/io_uring.c:5193:14: sparse:    right side has type int
   fs/io_uring.c:5207:67: sparse: sparse: incorrect type in argument 4 (dif=
ferent base types) @@     expected int mask @@     got restricted __poll_t =
[assigned] [usertype] mask @@
   fs/io_uring.c:5207:67: sparse:     expected int mask
   fs/io_uring.c:5207:67: sparse:     got restricted __poll_t [assigned] [u=
sertype] mask
   fs/io_uring.c:5208:52: sparse: sparse: incorrect type in argument 5 (dif=
ferent base types) @@     expected int events @@     got restricted __poll_=
t [usertype] events @@
   fs/io_uring.c:5208:52: sparse:     expected int events
   fs/io_uring.c:5208:52: sparse:     got restricted __poll_t [usertype] ev=
ents
   fs/io_uring.c:5369:24: sparse: sparse: invalid assignment: |=3D
>> fs/io_uring.c:5369:24: sparse:    left side has type unsigned int
>> fs/io_uring.c:5369:24: sparse:    right side has type restricted __poll_t
   fs/io_uring.c:5371:49: sparse: sparse: restricted __poll_t degrades to i=
nteger
   fs/io_uring.c:5370:57: sparse: sparse: restricted __poll_t degrades to i=
nteger
   fs/io_uring.c:5370:22: sparse: sparse: incorrect type in assignment (dif=
ferent base types) @@     expected restricted __poll_t [usertype] events @@=
     got unsigned int @@
   fs/io_uring.c:5370:22: sparse:     expected restricted __poll_t [usertyp=
e] events
   fs/io_uring.c:5370:22: sparse:     got unsigned int
   fs/io_uring.c:7112:13: sparse: sparse: context imbalance in 'io_sq_threa=
d_unpark' - wrong count at exit
   fs/io_uring.c:7124:13: sparse: sparse: context imbalance in 'io_sq_threa=
d_park' - wrong count at exit
   fs/io_uring.c:7177:17: sparse: sparse: context imbalance in 'io_sq_threa=
d_finish' - different lock contexts for basic block
   fs/io_uring.c:8694:25: sparse: sparse: context imbalance in 'io_uring_ca=
ncel_files' - unexpected unlock
   fs/io_uring.c:8742:9: sparse: sparse: context imbalance in 'io_uring_can=
cel_task_requests' - different lock contexts for basic block
   fs/io_uring.c:8840:13: sparse: sparse: context imbalance in 'io_uring_ca=
ncel_sqpoll' - different lock contexts for basic block

vim +5369 fs/io_uring.c

d7718a9d25a614 Jens Axboe        2020-02-14  5150  =

d7718a9d25a614 Jens Axboe        2020-02-14  5151  static bool io_arm_poll_=
handler(struct io_kiocb *req)
d7718a9d25a614 Jens Axboe        2020-02-14  5152  {
d7718a9d25a614 Jens Axboe        2020-02-14  5153  	const struct io_op_def =
*def =3D &io_op_defs[req->opcode];
d7718a9d25a614 Jens Axboe        2020-02-14  5154  	struct io_ring_ctx *ctx=
 =3D req->ctx;
d7718a9d25a614 Jens Axboe        2020-02-14  5155  	struct async_poll *apol=
l;
d7718a9d25a614 Jens Axboe        2020-02-14  5156  	struct io_poll_table ip=
t;
d7718a9d25a614 Jens Axboe        2020-02-14  5157  	__poll_t mask, ret;
9dab14b81807a4 Jens Axboe        2020-08-25  5158  	int rw;
d7718a9d25a614 Jens Axboe        2020-02-14  5159  =

d7718a9d25a614 Jens Axboe        2020-02-14  5160  	if (!req->file || !file=
_can_poll(req->file))
d7718a9d25a614 Jens Axboe        2020-02-14  5161  		return false;
24c74678634b3c Pavel Begunkov    2020-06-21  5162  	if (req->flags & REQ_F_=
POLLED)
d7718a9d25a614 Jens Axboe        2020-02-14  5163  		return false;
9dab14b81807a4 Jens Axboe        2020-08-25  5164  	if (def->pollin)
9dab14b81807a4 Jens Axboe        2020-08-25  5165  		rw =3D READ;
9dab14b81807a4 Jens Axboe        2020-08-25  5166  	else if (def->pollout)
9dab14b81807a4 Jens Axboe        2020-08-25  5167  		rw =3D WRITE;
9dab14b81807a4 Jens Axboe        2020-08-25  5168  	else
9dab14b81807a4 Jens Axboe        2020-08-25  5169  		return false;
9dab14b81807a4 Jens Axboe        2020-08-25  5170  	/* if we can't nonblock=
 try, then no point in arming a poll handler */
9dab14b81807a4 Jens Axboe        2020-08-25  5171  	if (!io_file_supports_a=
sync(req->file, rw))
d7718a9d25a614 Jens Axboe        2020-02-14  5172  		return false;
d7718a9d25a614 Jens Axboe        2020-02-14  5173  =

d7718a9d25a614 Jens Axboe        2020-02-14  5174  	apoll =3D kmalloc(sizeo=
f(*apoll), GFP_ATOMIC);
d7718a9d25a614 Jens Axboe        2020-02-14  5175  	if (unlikely(!apoll))
d7718a9d25a614 Jens Axboe        2020-02-14  5176  		return false;
807abcb0883439 Jens Axboe        2020-07-17  5177  	apoll->double_poll =3D =
NULL;
d7718a9d25a614 Jens Axboe        2020-02-14  5178  =

d7718a9d25a614 Jens Axboe        2020-02-14  5179  	req->flags |=3D REQ_F_P=
OLLED;
d7718a9d25a614 Jens Axboe        2020-02-14  5180  	req->apoll =3D apoll;
d7718a9d25a614 Jens Axboe        2020-02-14  5181  =

8755d97a09fed0 Nathan Chancellor 2020-03-02  5182  	mask =3D 0;
d7718a9d25a614 Jens Axboe        2020-02-14  5183  	if (def->pollin)
8755d97a09fed0 Nathan Chancellor 2020-03-02  5184  		mask |=3D POLLIN | POL=
LRDNORM;
d7718a9d25a614 Jens Axboe        2020-02-14  5185  	if (def->pollout)
d7718a9d25a614 Jens Axboe        2020-02-14  5186  		mask |=3D POLLOUT | PO=
LLWRNORM;
901341bb971888 Luke Hsiao        2020-08-21  5187  =

901341bb971888 Luke Hsiao        2020-08-21  5188  	/* If reading from MSG_=
ERRQUEUE using recvmsg, ignore POLLIN */
901341bb971888 Luke Hsiao        2020-08-21  5189  	if ((req->opcode =3D=3D=
 IORING_OP_RECVMSG) &&
901341bb971888 Luke Hsiao        2020-08-21  5190  	    (req->sr_msg.msg_fl=
ags & MSG_ERRQUEUE))
901341bb971888 Luke Hsiao        2020-08-21  5191  		mask &=3D ~POLLIN;
901341bb971888 Luke Hsiao        2020-08-21  5192  =

d7718a9d25a614 Jens Axboe        2020-02-14 @5193  	mask |=3D POLLERR | POL=
LPRI;
d7718a9d25a614 Jens Axboe        2020-02-14  5194  =

d7718a9d25a614 Jens Axboe        2020-02-14  5195  	ipt.pt._qproc =3D io_as=
ync_queue_proc;
d7718a9d25a614 Jens Axboe        2020-02-14  5196  =

d7718a9d25a614 Jens Axboe        2020-02-14  5197  	ret =3D __io_arm_poll_h=
andler(req, &apoll->poll, &ipt, mask,
d7718a9d25a614 Jens Axboe        2020-02-14  5198  					io_async_wake);
a36da65c46565d Jens Axboe        2020-08-11  5199  	if (ret || ipt.error) {
d4e7cd36a90e38 Jens Axboe        2020-08-15  5200  		io_poll_remove_double(=
req);
d7718a9d25a614 Jens Axboe        2020-02-14  5201  		spin_unlock_irq(&ctx->=
completion_lock);
807abcb0883439 Jens Axboe        2020-07-17  5202  		kfree(apoll->double_po=
ll);
d7718a9d25a614 Jens Axboe        2020-02-14  5203  		kfree(apoll);
d7718a9d25a614 Jens Axboe        2020-02-14  5204  		return false;
d7718a9d25a614 Jens Axboe        2020-02-14  5205  	}
d7718a9d25a614 Jens Axboe        2020-02-14  5206  	spin_unlock_irq(&ctx->c=
ompletion_lock);
d7718a9d25a614 Jens Axboe        2020-02-14  5207  	trace_io_uring_poll_arm=
(ctx, req->opcode, req->user_data, mask,
d7718a9d25a614 Jens Axboe        2020-02-14  5208  					apoll->poll.events);
d7718a9d25a614 Jens Axboe        2020-02-14  5209  	return true;
d7718a9d25a614 Jens Axboe        2020-02-14  5210  }
d7718a9d25a614 Jens Axboe        2020-02-14  5211  =

d7718a9d25a614 Jens Axboe        2020-02-14  5212  static bool __io_poll_re=
move_one(struct io_kiocb *req,
d7718a9d25a614 Jens Axboe        2020-02-14  5213  				 struct io_poll_iocb=
 *poll)
221c5eb2338232 Jens Axboe        2019-01-17  5214  {
b41e98524e424d Jens Axboe        2020-02-17  5215  	bool do_complete =3D fa=
lse;
221c5eb2338232 Jens Axboe        2019-01-17  5216  =

221c5eb2338232 Jens Axboe        2019-01-17  5217  	spin_lock(&poll->head->=
lock);
221c5eb2338232 Jens Axboe        2019-01-17  5218  	WRITE_ONCE(poll->cancel=
ed, true);
392edb45b24337 Jens Axboe        2019-12-09  5219  	if (!list_empty(&poll->=
wait.entry)) {
392edb45b24337 Jens Axboe        2019-12-09  5220  		list_del_init(&poll->w=
ait.entry);
b41e98524e424d Jens Axboe        2020-02-17  5221  		do_complete =3D true;
221c5eb2338232 Jens Axboe        2019-01-17  5222  	}
221c5eb2338232 Jens Axboe        2019-01-17  5223  	spin_unlock(&poll->head=
->lock);
3bfa5bcb26f0b5 Jens Axboe        2020-05-17  5224  	hash_del(&req->hash_nod=
e);
d7718a9d25a614 Jens Axboe        2020-02-14  5225  	return do_complete;
d7718a9d25a614 Jens Axboe        2020-02-14  5226  }
d7718a9d25a614 Jens Axboe        2020-02-14  5227  =

d7718a9d25a614 Jens Axboe        2020-02-14  5228  static bool io_poll_remo=
ve_one(struct io_kiocb *req)
d7718a9d25a614 Jens Axboe        2020-02-14  5229  {
d7718a9d25a614 Jens Axboe        2020-02-14  5230  	bool do_complete;
d7718a9d25a614 Jens Axboe        2020-02-14  5231  =

d4e7cd36a90e38 Jens Axboe        2020-08-15  5232  	io_poll_remove_double(r=
eq);
d4e7cd36a90e38 Jens Axboe        2020-08-15  5233  =

d7718a9d25a614 Jens Axboe        2020-02-14  5234  	if (req->opcode =3D=3D =
IORING_OP_POLL_ADD) {
d7718a9d25a614 Jens Axboe        2020-02-14  5235  		do_complete =3D __io_p=
oll_remove_one(req, &req->poll);
d7718a9d25a614 Jens Axboe        2020-02-14  5236  	} else {
3bfa5bcb26f0b5 Jens Axboe        2020-05-17  5237  		struct async_poll *apo=
ll =3D req->apoll;
3bfa5bcb26f0b5 Jens Axboe        2020-05-17  5238  =

d7718a9d25a614 Jens Axboe        2020-02-14  5239  		/* non-poll requests h=
ave submit ref still */
3bfa5bcb26f0b5 Jens Axboe        2020-05-17  5240  		do_complete =3D __io_p=
oll_remove_one(req, &apoll->poll);
3bfa5bcb26f0b5 Jens Axboe        2020-05-17  5241  		if (do_complete) {
d7718a9d25a614 Jens Axboe        2020-02-14  5242  			io_put_req(req);
807abcb0883439 Jens Axboe        2020-07-17  5243  			kfree(apoll->double_p=
oll);
b1f573bd15fda2 Xiaoguang Wang    2020-04-12  5244  			kfree(apoll);
b1f573bd15fda2 Xiaoguang Wang    2020-04-12  5245  		}
3bfa5bcb26f0b5 Jens Axboe        2020-05-17  5246  	}
b1f573bd15fda2 Xiaoguang Wang    2020-04-12  5247  =

b41e98524e424d Jens Axboe        2020-02-17  5248  	if (do_complete) {
b41e98524e424d Jens Axboe        2020-02-17  5249  		io_cqring_fill_event(r=
eq, -ECANCELED);
b41e98524e424d Jens Axboe        2020-02-17  5250  		io_commit_cqring(req->=
ctx);
f254ac04c8744c Jens Axboe        2020-08-12  5251  		req_set_fail_links(req=
);
216578e55ac932 Pavel Begunkov    2020-10-13  5252  		io_put_req_deferred(re=
q, 1);
b41e98524e424d Jens Axboe        2020-02-17  5253  	}
b41e98524e424d Jens Axboe        2020-02-17  5254  =

b41e98524e424d Jens Axboe        2020-02-17  5255  	return do_complete;
221c5eb2338232 Jens Axboe        2019-01-17  5256  }
221c5eb2338232 Jens Axboe        2019-01-17  5257  =

76e1b6427fd824 Jens Axboe        2020-09-26  5258  /*
76e1b6427fd824 Jens Axboe        2020-09-26  5259   * Returns true if we fo=
und and killed one or more poll requests
76e1b6427fd824 Jens Axboe        2020-09-26  5260   */
6b81928d4ca866 Pavel Begunkov    2020-11-06  5261  static bool io_poll_remo=
ve_all(struct io_ring_ctx *ctx, struct task_struct *tsk,
6b81928d4ca866 Pavel Begunkov    2020-11-06  5262  			       struct files_s=
truct *files)
221c5eb2338232 Jens Axboe        2019-01-17  5263  {
78076bb64aa8ba Jens Axboe        2019-12-04  5264  	struct hlist_node *tmp;
221c5eb2338232 Jens Axboe        2019-01-17  5265  	struct io_kiocb *req;
8e2e1faf28b3e6 Jens Axboe        2020-04-13  5266  	int posted =3D 0, i;
221c5eb2338232 Jens Axboe        2019-01-17  5267  =

221c5eb2338232 Jens Axboe        2019-01-17  5268  	spin_lock_irq(&ctx->com=
pletion_lock);
78076bb64aa8ba Jens Axboe        2019-12-04  5269  	for (i =3D 0; i < (1U <=
< ctx->cancel_hash_bits); i++) {
78076bb64aa8ba Jens Axboe        2019-12-04  5270  		struct hlist_head *lis=
t;
78076bb64aa8ba Jens Axboe        2019-12-04  5271  =

78076bb64aa8ba Jens Axboe        2019-12-04  5272  		list =3D &ctx->cancel_=
hash[i];
f3606e3a92ddd3 Jens Axboe        2020-09-22  5273  		hlist_for_each_entry_s=
afe(req, tmp, list, hash_node) {
6b81928d4ca866 Pavel Begunkov    2020-11-06  5274  			if (io_match_task(req=
, tsk, files))
8e2e1faf28b3e6 Jens Axboe        2020-04-13  5275  				posted +=3D io_poll_=
remove_one(req);
221c5eb2338232 Jens Axboe        2019-01-17  5276  		}
f3606e3a92ddd3 Jens Axboe        2020-09-22  5277  	}
221c5eb2338232 Jens Axboe        2019-01-17  5278  	spin_unlock_irq(&ctx->c=
ompletion_lock);
b41e98524e424d Jens Axboe        2020-02-17  5279  =

8e2e1faf28b3e6 Jens Axboe        2020-04-13  5280  	if (posted)
b41e98524e424d Jens Axboe        2020-02-17  5281  		io_cqring_ev_posted(ct=
x);
76e1b6427fd824 Jens Axboe        2020-09-26  5282  =

76e1b6427fd824 Jens Axboe        2020-09-26  5283  	return posted !=3D 0;
221c5eb2338232 Jens Axboe        2019-01-17  5284  }
221c5eb2338232 Jens Axboe        2019-01-17  5285  =

47f467686ec02f Jens Axboe        2019-11-09  5286  static int io_poll_cance=
l(struct io_ring_ctx *ctx, __u64 sqe_addr)
47f467686ec02f Jens Axboe        2019-11-09  5287  {
78076bb64aa8ba Jens Axboe        2019-12-04  5288  	struct hlist_head *list;
47f467686ec02f Jens Axboe        2019-11-09  5289  	struct io_kiocb *req;
47f467686ec02f Jens Axboe        2019-11-09  5290  =

78076bb64aa8ba Jens Axboe        2019-12-04  5291  	list =3D &ctx->cancel_h=
ash[hash_long(sqe_addr, ctx->cancel_hash_bits)];
78076bb64aa8ba Jens Axboe        2019-12-04  5292  	hlist_for_each_entry(re=
q, list, hash_node) {
b41e98524e424d Jens Axboe        2020-02-17  5293  		if (sqe_addr !=3D req-=
>user_data)
b41e98524e424d Jens Axboe        2020-02-17  5294  			continue;
b41e98524e424d Jens Axboe        2020-02-17  5295  		if (io_poll_remove_one=
(req))
47f467686ec02f Jens Axboe        2019-11-09  5296  			return 0;
b41e98524e424d Jens Axboe        2020-02-17  5297  		return -EALREADY;
eac406c61cd0ec Jens Axboe        2019-11-14  5298  	}
47f467686ec02f Jens Axboe        2019-11-09  5299  =

47f467686ec02f Jens Axboe        2019-11-09  5300  	return -ENOENT;
47f467686ec02f Jens Axboe        2019-11-09  5301  }
47f467686ec02f Jens Axboe        2019-11-09  5302  =

3529d8c2b353e6 Jens Axboe        2019-12-19  5303  static int io_poll_remov=
e_prep(struct io_kiocb *req,
3529d8c2b353e6 Jens Axboe        2019-12-19  5304  			       const struct i=
o_uring_sqe *sqe)
0969e783e3a891 Jens Axboe        2019-12-17  5305  {
0969e783e3a891 Jens Axboe        2019-12-17  5306  	if (unlikely(req->ctx->=
flags & IORING_SETUP_IOPOLL))
0969e783e3a891 Jens Axboe        2019-12-17  5307  		return -EINVAL;
0969e783e3a891 Jens Axboe        2019-12-17  5308  	if (sqe->ioprio || sqe-=
>off || sqe->len || sqe->buf_index ||
0969e783e3a891 Jens Axboe        2019-12-17  5309  	    sqe->poll_events)
0969e783e3a891 Jens Axboe        2019-12-17  5310  		return -EINVAL;
0969e783e3a891 Jens Axboe        2019-12-17  5311  =

018043be1f1bc4 Pavel Begunkov    2020-10-27  5312  	req->poll_remove.addr =
=3D READ_ONCE(sqe->addr);
0969e783e3a891 Jens Axboe        2019-12-17  5313  	return 0;
0969e783e3a891 Jens Axboe        2019-12-17  5314  }
0969e783e3a891 Jens Axboe        2019-12-17  5315  =

221c5eb2338232 Jens Axboe        2019-01-17  5316  /*
221c5eb2338232 Jens Axboe        2019-01-17  5317   * Find a running poll c=
ommand that matches one specified in sqe->addr,
221c5eb2338232 Jens Axboe        2019-01-17  5318   * and remove it if foun=
d.
221c5eb2338232 Jens Axboe        2019-01-17  5319   */
61e98203047983 Pavel Begunkov    2021-02-10  5320  static int io_poll_remov=
e(struct io_kiocb *req, unsigned int issue_flags)
221c5eb2338232 Jens Axboe        2019-01-17  5321  {
221c5eb2338232 Jens Axboe        2019-01-17  5322  	struct io_ring_ctx *ctx=
 =3D req->ctx;
47f467686ec02f Jens Axboe        2019-11-09  5323  	int ret;
221c5eb2338232 Jens Axboe        2019-01-17  5324  =

221c5eb2338232 Jens Axboe        2019-01-17  5325  	spin_lock_irq(&ctx->com=
pletion_lock);
018043be1f1bc4 Pavel Begunkov    2020-10-27  5326  	ret =3D io_poll_cancel(=
ctx, req->poll_remove.addr);
221c5eb2338232 Jens Axboe        2019-01-17  5327  	spin_unlock_irq(&ctx->c=
ompletion_lock);
221c5eb2338232 Jens Axboe        2019-01-17  5328  =

4e88d6e7793f2f Jens Axboe        2019-12-07  5329  	if (ret < 0)
4e88d6e7793f2f Jens Axboe        2019-12-07  5330  		req_set_fail_links(req=
);
e1e16097e265da Jens Axboe        2020-06-22  5331  	io_req_complete(req, re=
t);
221c5eb2338232 Jens Axboe        2019-01-17  5332  	return 0;
221c5eb2338232 Jens Axboe        2019-01-17  5333  }
221c5eb2338232 Jens Axboe        2019-01-17  5334  =

221c5eb2338232 Jens Axboe        2019-01-17  5335  static int io_poll_wake(=
struct wait_queue_entry *wait, unsigned mode, int sync,
221c5eb2338232 Jens Axboe        2019-01-17  5336  			void *key)
221c5eb2338232 Jens Axboe        2019-01-17  5337  {
c2f2eb7d2c1cdc Jens Axboe        2020-02-10  5338  	struct io_kiocb *req =
=3D wait->private;
c2f2eb7d2c1cdc Jens Axboe        2020-02-10  5339  	struct io_poll_iocb *po=
ll =3D &req->poll;
221c5eb2338232 Jens Axboe        2019-01-17  5340  =

d7718a9d25a614 Jens Axboe        2020-02-14  5341  	return __io_async_wake(=
req, poll, key_to_poll(key), io_poll_task_func);
221c5eb2338232 Jens Axboe        2019-01-17  5342  }
221c5eb2338232 Jens Axboe        2019-01-17  5343  =

221c5eb2338232 Jens Axboe        2019-01-17  5344  static void io_poll_queu=
e_proc(struct file *file, struct wait_queue_head *head,
221c5eb2338232 Jens Axboe        2019-01-17  5345  			       struct poll_ta=
ble_struct *p)
221c5eb2338232 Jens Axboe        2019-01-17  5346  {
221c5eb2338232 Jens Axboe        2019-01-17  5347  	struct io_poll_table *p=
t =3D container_of(p, struct io_poll_table, pt);
221c5eb2338232 Jens Axboe        2019-01-17  5348  =

e8c2bc1fb6c949 Jens Axboe        2020-08-15  5349  	__io_queue_proc(&pt->re=
q->poll, pt, head, (struct io_poll_iocb **) &pt->req->async_data);
eac406c61cd0ec Jens Axboe        2019-11-14  5350  }
eac406c61cd0ec Jens Axboe        2019-11-14  5351  =

3529d8c2b353e6 Jens Axboe        2019-12-19  5352  static int io_poll_add_p=
rep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
221c5eb2338232 Jens Axboe        2019-01-17  5353  {
221c5eb2338232 Jens Axboe        2019-01-17  5354  	struct io_poll_iocb *po=
ll =3D &req->poll;
5769a351b89cd4 Jiufei Xue        2020-06-17  5355  	u32 events;
221c5eb2338232 Jens Axboe        2019-01-17  5356  =

221c5eb2338232 Jens Axboe        2019-01-17  5357  	if (unlikely(req->ctx->=
flags & IORING_SETUP_IOPOLL))
221c5eb2338232 Jens Axboe        2019-01-17  5358  		return -EINVAL;
8e66ada09e9d0a Jens Axboe        2021-02-22  5359  	if (sqe->addr || sqe->i=
oprio || sqe->off || sqe->buf_index)
8e66ada09e9d0a Jens Axboe        2021-02-22  5360  		return -EINVAL;
8e66ada09e9d0a Jens Axboe        2021-02-22  5361  	if (sqe->len & ~IORING_=
POLL_ADD_MULTI)
221c5eb2338232 Jens Axboe        2019-01-17  5362  		return -EINVAL;
221c5eb2338232 Jens Axboe        2019-01-17  5363  =

5769a351b89cd4 Jiufei Xue        2020-06-17  5364  	events =3D READ_ONCE(sq=
e->poll32_events);
5769a351b89cd4 Jiufei Xue        2020-06-17  5365  #ifdef __BIG_ENDIAN
5769a351b89cd4 Jiufei Xue        2020-06-17  5366  	events =3D swahw32(even=
ts);
5769a351b89cd4 Jiufei Xue        2020-06-17  5367  #endif
8e66ada09e9d0a Jens Axboe        2021-02-22  5368  	if (!sqe->len)
8e66ada09e9d0a Jens Axboe        2021-02-22 @5369  		events |=3D EPOLLONESH=
OT;
a31eb4a2f1650f Jiufei Xue        2020-06-17  5370  	poll->events =3D demang=
le_poll(events) | EPOLLERR | EPOLLHUP |
8e66ada09e9d0a Jens Axboe        2021-02-22  5371  		       (events & (EPOL=
LEXCLUSIVE|EPOLLONESHOT));
0969e783e3a891 Jens Axboe        2019-12-17  5372  	return 0;
0969e783e3a891 Jens Axboe        2019-12-17  5373  }
0969e783e3a891 Jens Axboe        2019-12-17  5374  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0158596723423278612==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0158596723423278612==--


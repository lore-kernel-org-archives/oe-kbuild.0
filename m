Content-Type: multipart/mixed; boundary="===============0709754996880692810=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [congwang:bpf 6/6] net/core/skmsg.c:420:3: warning: Assignment of function parameter has no effect outside the function. [uselessAssignmentArg]
Date: Mon, 17 May 2021 11:48:46 +0800
Message-ID: <202105171143.9ck0oqXr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0709754996880692810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Cong Wang <cong.wang@bytedance.com>

tree:   https://github.com/congwang/linux.git bpf
head:   f32ecd3b543074a848132bbdb4c94f96c4b9f83a
commit: f32ecd3b543074a848132bbdb4c94f96c4b9f83a [6/6] udp_bpf: use psock l=
ock to serilize ->recvmsg()
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/core/skmsg.c:420:3: warning: Assignment of function parameter has no=
 effect outside the function. [uselessAssignmentArg]
     timeo =3D wait_woken(&wait, TASK_INTERRUPTIBLE, timeo);
     ^

vim +420 net/core/skmsg.c

604326b41a6fb9 Daniel Borkmann 2018-10-13  401  =

53174844f4fa03 Cong Wang       2021-05-16  402  int sk_msg_wait_data(struct=
 sock *sk, struct sk_psock *psock,
53174844f4fa03 Cong Wang       2021-05-16  403  		     struct sk_buff_head =
*queue, long timeo)
2bc793e3272a13 Cong Wang       2021-03-30  404  {
2bc793e3272a13 Cong Wang       2021-03-30  405  	DEFINE_WAIT_FUNC(wait, wok=
en_wake_function);
2bc793e3272a13 Cong Wang       2021-03-30  406  	int ret =3D 0;
2bc793e3272a13 Cong Wang       2021-03-30  407  =

2bc793e3272a13 Cong Wang       2021-03-30  408  	if (sk->sk_shutdown & RCV_=
SHUTDOWN)
2bc793e3272a13 Cong Wang       2021-03-30  409  		return 1;
2bc793e3272a13 Cong Wang       2021-03-30  410  =

2bc793e3272a13 Cong Wang       2021-03-30  411  	if (!timeo)
2bc793e3272a13 Cong Wang       2021-03-30  412  		return ret;
2bc793e3272a13 Cong Wang       2021-03-30  413  =

2bc793e3272a13 Cong Wang       2021-03-30  414  	add_wait_queue(sk_sleep(sk=
), &wait);
2bc793e3272a13 Cong Wang       2021-03-30  415  	sk_set_bit(SOCKWQ_ASYNC_WA=
ITDATA, sk);
f32ecd3b543074 Cong Wang       2021-05-16  416  	mutex_unlock(&psock->lock);
f32ecd3b543074 Cong Wang       2021-05-16  417  	ret =3D !skb_queue_empty(&=
psock->ingress_skb) ||
f32ecd3b543074 Cong Wang       2021-05-16  418  	      !list_empty(&psock->=
ingress_msg) || !skb_queue_empty(queue);
f32ecd3b543074 Cong Wang       2021-05-16  419  	if (!ret)
f32ecd3b543074 Cong Wang       2021-05-16 @420  		timeo =3D wait_woken(&wai=
t, TASK_INTERRUPTIBLE, timeo);
f32ecd3b543074 Cong Wang       2021-05-16  421  	mutex_lock(&psock->lock);
f32ecd3b543074 Cong Wang       2021-05-16  422  	ret =3D !skb_queue_empty(&=
psock->ingress_skb) ||
f32ecd3b543074 Cong Wang       2021-05-16  423  	      !list_empty(&psock->=
ingress_msg) || !skb_queue_empty(queue);
f32ecd3b543074 Cong Wang       2021-05-16  424  =

2bc793e3272a13 Cong Wang       2021-03-30  425  	sk_clear_bit(SOCKWQ_ASYNC_=
WAITDATA, sk);
2bc793e3272a13 Cong Wang       2021-03-30  426  	remove_wait_queue(sk_sleep=
(sk), &wait);
2bc793e3272a13 Cong Wang       2021-03-30  427  	return ret;
2bc793e3272a13 Cong Wang       2021-03-30  428  }
2bc793e3272a13 Cong Wang       2021-03-30  429  EXPORT_SYMBOL_GPL(sk_msg_wa=
it_data);
2bc793e3272a13 Cong Wang       2021-03-30  430  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0709754996880692810==--


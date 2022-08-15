Content-Type: multipart/mixed; boundary="===============7167773739686449893=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] af_unix: Add ioctl(SIOCUNIXGRABFDS) to grab files of receive queue skbs
Date: Mon, 15 Aug 2022 12:37:41 +0800
Message-ID: <202208151232.4lhp28Lp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7167773739686449893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <9293c7ee-6fb7-7142-66fe-051548ffb65c@ya.ru>
References: <9293c7ee-6fb7-7142-66fe-051548ffb65c@ya.ru>
TO: Kirill Tkhai <tkhai@ya.ru>
TO: netdev(a)vger.kernel.org
CC: Eric Dumazet <edumazet@google.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Kirill Tkhai <tkhai@ya.ru>

Hi Kirill,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net/master]
[also build test WARNING on net-next/master linus/master horms-ipvs/master =
v6.0-rc1 next-20220812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kirill-Tkhai/af_unix=
-Add-ioctl-SIOCUNIXGRABFDS-to-grab-files-of-receive-queue-skbs/20220815-045=
608
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 77788=
5673122b78b2abd2f1e428730961a786ff2
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20815/202208151232.4lhp28Lp-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/unix/af_unix.c:3130 unix_ioc_grab_fds() warn: potential spectre issue '=
fp->fp' [r] (local cap)

Old smatch warnings:
net/unix/af_unix.c:1605 unix_stream_connect() warn: variable dereferenced b=
efore check 'other' (see line 1488)

vim +3130 net/unix/af_unix.c

ba94f3088b792b Andrey Vagin 2017-02-01  3081  =

0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3082  static int unix_ioc_grab_fds(=
struct sock *sk, struct unix_ioc_grab_fds __user *uarg)
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3083  {
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3084  	int i, todo, skip, count, al=
l, err, done =3D 0;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3085  	struct unix_sock *u =3D unix=
_sk(sk);
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3086  	struct unix_ioc_grab_fds arg;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3087  	struct sk_buff *skb =3D NULL;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3088  	struct scm_fp_list *fp;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3089  =

0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3090  	if (copy_from_user(&arg, uar=
g, sizeof(arg)))
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3091  		return -EFAULT;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3092  =

0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3093  	skip =3D arg.in.nr_skip;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3094  	todo =3D arg.in.nr_grab;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3095  =

0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3096  	if (skip < 0 || todo <=3D 0)
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3097  		return -EINVAL;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3098  	if (mutex_lock_interruptible=
(&u->iolock))
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3099  		return -EINTR;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3100  =

0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3101  	all =3D atomic_read(&u->scm_=
stat.nr_fds);
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3102  	err =3D -EFAULT;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3103  	/* Set uarg->out.nr_all befo=
re the first file is received. */
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3104  	if (put_user(all, &uarg->out=
.nr_all))
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3105  		goto unlock;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3106  	err =3D 0;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3107  	if (all <=3D skip)
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3108  		goto unlock;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3109  	if (all - skip < todo)
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3110  		todo =3D all - skip;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3111  	while (todo) {
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3112  		spin_lock(&sk->sk_receive_q=
ueue.lock);
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3113  		if (!skb)
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3114  			skb =3D skb_peek(&sk->sk_r=
eceive_queue);
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3115  		else
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3116  			skb =3D skb_peek_next(skb,=
 &sk->sk_receive_queue);
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3117  		spin_unlock(&sk->sk_receive=
_queue.lock);
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3118  =

0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3119  		if (!skb)
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3120  			goto unlock;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3121  =

0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3122  		fp =3D UNIXCB(skb).fp;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3123  		count =3D fp->count;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3124  		if (skip >=3D count) {
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3125  			skip -=3D count;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3126  			continue;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3127  		}
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3128  =

0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3129  		for (i =3D skip; i < count =
&& todo; i++) {
0b4bc309fb3cdc Kirill Tkhai 2022-08-14 @3130  			err =3D receive_fd_user(fp=
->fp[i], &arg.in.fds[done], 0);
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3131  			if (err < 0)
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3132  				goto unlock;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3133  			done++;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3134  			todo--;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3135  		}
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3136  		skip =3D 0;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3137  	}
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3138  unlock:
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3139  	mutex_unlock(&u->iolock);
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3140  =

0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3141  	/* Return number of fds (non=
-error) if there is a received file. */
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3142  	if (done)
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3143  		return done;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3144  	if (err < 0)
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3145  		return err;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3146  	return 0;
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3147  }
0b4bc309fb3cdc Kirill Tkhai 2022-08-14  3148  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7167773739686449893==--


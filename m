Content-Type: multipart/mixed; boundary="===============0656754655847356473=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ksmbd/transport_ipc.c:235 ipc_msg_alloc() warn: Please consider using kvzalloc instead of kvmalloc
Date: Wed, 01 Jun 2022 05:49:59 +0800
Message-ID: <202206010547.sX3JaQw1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0656754655847356473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Namjae Jeon <namjae.jeon@samsung.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e1cbc3b96a9974746b2a80c3a6c8a0f7eff7b1b5
commit: 1a93084b9a89818aec0ac7b59a5a51f2112bf203 ksmbd: move fs/cifsd to fs=
/ksmbd
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-m031-20220531 (https://download.01.org/0day-ci/arc=
hive/20220601/202206010547.sX3JaQw1-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/ksmbd/transport_ipc.c:235 ipc_msg_alloc() warn: Please consider using kv=
zalloc instead of kvmalloc
fs/ksmbd/transport_ipc.c:274 handle_response() warn: Please consider using =
kvzalloc instead of kvmalloc
fs/ksmbd/smb2pdu.c:556 smb2_allocate_rsp_buf() warn: Please consider using =
kvzalloc instead of kvmalloc
fs/ksmbd/smb2pdu.c:5817 smb2_read_pipe() warn: Please consider using kvzall=
oc instead of kvmalloc
fs/ksmbd/smb2pdu.c:5931 smb2_read() warn: Please consider using kvzalloc in=
stead of kvmalloc
fs/ksmbd/smb2pdu.c:6104 smb2_write_rdma_channel() warn: Please consider usi=
ng kvzalloc instead of kvmalloc
fs/ksmbd/vfs.c:426 ksmbd_vfs_stream_write() warn: Please consider using kvz=
alloc instead of kvmalloc
fs/ksmbd/vfs.c:908 ksmbd_vfs_listxattr() warn: Please consider using kvzall=
oc instead of kvmalloc

Old smatch warnings:
fs/ksmbd/smb2pdu.c:1717 smb2_sess_setup() error: uninitialized symbol 'sess=
'.
fs/ksmbd/smb2pdu.c:3102 smb2_open() warn: Function too hairy.  No more merg=
es.
fs/ksmbd/smb2pdu.c:6628 smb2_lock() warn: inconsistent indenting
fs/ksmbd/smb2pdu.c:6636 smb2_lock() warn: inconsistent indenting
fs/ksmbd/vfs.c:1700 ksmbd_vfs_xattr_stream_name() warn: inconsistent indent=
ing

vim +235 fs/ksmbd/transport_ipc.c

0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  229  =

0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  230  static=
 struct ksmbd_ipc_msg *ipc_msg_alloc(size_t sz)
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  231  {
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  232  	struc=
t ksmbd_ipc_msg *msg;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  233  	size_=
t msg_sz =3D sz + sizeof(struct ksmbd_ipc_msg);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  234  =

79f6b11a104f3a fs/cifsd/transport_ipc.c Namjae Jeon 2021-04-02 @235  	msg =
=3D kvmalloc(msg_sz, GFP_KERNEL | __GFP_ZERO);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  236  	if (m=
sg)
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  237  		msg-=
>sz =3D sz;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  238  	retur=
n msg;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  239  }
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  240  =

0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  241  static=
 void ipc_msg_free(struct ksmbd_ipc_msg *msg)
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  242  {
79f6b11a104f3a fs/cifsd/transport_ipc.c Namjae Jeon 2021-04-02  243  	kvfre=
e(msg);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  244  }
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  245  =

0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  246  static=
 void ipc_msg_handle_free(int handle)
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  247  {
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  248  	if (h=
andle >=3D 0)
d40012a83f87f4 fs/cifsd/transport_ipc.c Namjae Jeon 2021-04-13  249  		ksmb=
d_release_id(&ipc_ida, handle);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  250  }
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  251  =

0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  252  static=
 int handle_response(int type, void *payload, size_t sz)
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  253  {
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  254  	int h=
andle =3D KSMBD_IPC_MSG_HANDLE(payload);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  255  	struc=
t ipc_msg_table_entry *entry;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  256  	int r=
et =3D 0;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  257  =

0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  258  	ipc_u=
pdate_last_active();
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  259  	down_=
read(&ipc_msg_table_lock);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  260  	hash_=
for_each_possible(ipc_msg_table, entry, ipc_table_hlist, handle) {
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  261  		if (=
handle !=3D entry->handle)
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  262  			con=
tinue;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  263  =

0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  264  		entr=
y->response =3D NULL;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  265  		/*
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  266  		 * R=
esponse message type value should be equal to
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  267  		 * r=
equest message type + 1.
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  268  		 */
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  269  		if (=
entry->type + 1 !=3D type) {
bde1694aecdb53 fs/cifsd/transport_ipc.c Namjae Jeon 2021-06-28  270  			pr_=
err("Waiting for IPC type %d, got %d. Ignore.\n",
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  271  			   =
    entry->type + 1, type);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  272  		}
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  273  =

79f6b11a104f3a fs/cifsd/transport_ipc.c Namjae Jeon 2021-04-02 @274  		entr=
y->response =3D kvmalloc(sz, GFP_KERNEL | __GFP_ZERO);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  275  		if (=
!entry->response) {
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  276  			ret=
 =3D -ENOMEM;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  277  			bre=
ak;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  278  		}
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  279  =

0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  280  		memc=
py(entry->response, payload, sz);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  281  		wake=
_up_interruptible(&entry->wait);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  282  		ret =
=3D 0;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  283  		brea=
k;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  284  	}
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  285  	up_re=
ad(&ipc_msg_table_lock);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  286  =

0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  287  	retur=
n ret;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  288  }
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon 2021-03-16  289  =


:::::: The code at line 235 was first introduced by commit
:::::: 79f6b11a104f3a32f4f4a6f7808a02c301c19710 cifsd: remove wrappers of k=
vmalloc/kvfree

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0656754655847356473==--


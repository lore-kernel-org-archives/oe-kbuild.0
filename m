Content-Type: multipart/mixed; boundary="===============3253876662653700598=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10392/13707] drivers/misc/habanalabs/common/command_submission.c:950 cs_ioctl_signal_wait() warn: should 'cb->id << 12' be a 64 bit
Date: Wed, 05 Aug 2020 15:40:54 +0800
Message-ID: <202008051550.JKVHwUeo%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3253876662653700598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Oded Gabbay <oded.gabbay@gmail.com>
CC: Omer Shpigelman <oshpigelman@habana.ai>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   1cfc1dba44c2b62b2856bf23624116eea9cd5627
commit: 70b2f993ea4a79c298aac4ec1c58089020536ba5 [10392/13707] habanalabs: =
create common folder
:::::: branch date: 23 hours ago
:::::: commit date: 12 days ago
config: i386-randconfig-m021-20200805 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/misc/habanalabs/common/command_submission.c:950 cs_ioctl_signal_wai=
t() warn: should 'cb->id << 12' be a 64 bit type?

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D70b2f993ea4a79c298aac4ec1c58089020536ba5
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout 70b2f993ea4a79c298aac4ec1c58089020536ba5
vim +950 drivers/misc/habanalabs/common/command_submission.c

eff6f4a0e70b7b drivers/misc/habanalabs/command_submission.c Oded Gabbay    =
 2019-02-16  768  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  769  static int cs_ioctl_signal_wait(struct hl_fpriv *hpriv, e=
num hl_cs_type cs_type,
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  770  				void __user *chunks, u32 num_chunks,
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  771  				u64 *cs_seq)
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  772  {
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  773  	struct hl_device *hdev =3D hpriv->hdev;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  774  	struct hl_ctx *ctx =3D hpriv->ctx;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  775  	struct hl_cs_chunk *cs_chunk_array, *chunk;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  776  	struct hw_queue_properties *hw_queue_prop;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  777  	struct dma_fence *sig_fence =3D NULL;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  778  	struct hl_cs_job *job;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  779  	struct hl_cs *cs;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  780  	struct hl_cb *cb;
21e7a346344959 drivers/misc/habanalabs/command_submission.c Ofir Bitton    =
 2020-05-14  781  	enum hl_queue_type q_type;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  782  	u64 *signal_seq_arr =3D NULL, signal_seq;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  783  	u32 size_to_copy, q_idx, signal_seq_arr_len, cb_size;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  784  	int rc;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  785  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  786  	*cs_seq =3D ULLONG_MAX;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  787  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  788  	if (num_chunks > HL_MAX_JOBS_PER_CS) {
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  789  		dev_err(hdev->dev,
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  790  			"Number of chunks can NOT be larger than %d\n",
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  791  			HL_MAX_JOBS_PER_CS);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  792  		rc =3D -EINVAL;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  793  		goto out;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  794  	}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  795  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  796  	cs_chunk_array =3D kmalloc_array(num_chunks, sizeof(*cs_=
chunk_array),
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  797  					GFP_ATOMIC);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  798  	if (!cs_chunk_array) {
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  799  		rc =3D -ENOMEM;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  800  		goto out;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  801  	}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  802  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  803  	size_to_copy =3D num_chunks * sizeof(struct hl_cs_chunk);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  804  	if (copy_from_user(cs_chunk_array, chunks, size_to_copy)=
) {
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  805  		dev_err(hdev->dev, "Failed to copy cs chunk array from =
user\n");
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  806  		rc =3D -EFAULT;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  807  		goto free_cs_chunk_array;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  808  	}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  809  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  810  	/* currently it is guaranteed to have only one chunk */
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  811  	chunk =3D &cs_chunk_array[0];
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  812  	q_idx =3D chunk->queue_index;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  813  	hw_queue_prop =3D &hdev->asic_prop.hw_queues_props[q_idx=
];
21e7a346344959 drivers/misc/habanalabs/command_submission.c Ofir Bitton    =
 2020-05-14  814  	q_type =3D hw_queue_prop->type;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  815  =

3abc99bb7dcbc0 drivers/misc/habanalabs/command_submission.c Ofir Bitton    =
 2020-06-23  816  	if ((q_idx >=3D hdev->asic_prop.max_queues) ||
21e7a346344959 drivers/misc/habanalabs/command_submission.c Ofir Bitton    =
 2020-05-14  817  			(!hw_queue_prop->supports_sync_stream)) {
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  818  		dev_err(hdev->dev, "Queue index %d is invalid\n", q_idx=
);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  819  		rc =3D -EINVAL;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  820  		goto free_cs_chunk_array;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  821  	}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  822  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  823  	if (cs_type =3D=3D CS_TYPE_WAIT) {
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  824  		struct hl_cs_compl *sig_waitcs_cmpl;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  825  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  826  		signal_seq_arr_len =3D chunk->num_signal_seq_arr;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  827  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  828  		/* currently only one signal seq is supported */
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  829  		if (signal_seq_arr_len !=3D 1) {
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  830  			dev_err(hdev->dev,
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  831  				"Wait for signal CS supports only one signal CS seq\n=
");
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  832  			rc =3D -EINVAL;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  833  			goto free_cs_chunk_array;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  834  		}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  835  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  836  		signal_seq_arr =3D kmalloc_array(signal_seq_arr_len,
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  837  						sizeof(*signal_seq_arr),
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  838  						GFP_ATOMIC);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  839  		if (!signal_seq_arr) {
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  840  			rc =3D -ENOMEM;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  841  			goto free_cs_chunk_array;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  842  		}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  843  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  844  		size_to_copy =3D chunk->num_signal_seq_arr *
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  845  				sizeof(*signal_seq_arr);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  846  		if (copy_from_user(signal_seq_arr,
05c8a4fc44a916 drivers/misc/habanalabs/command_submission.c Oded Gabbay    =
 2020-06-01  847  					u64_to_user_ptr(chunk->signal_seq_arr),
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  848  					size_to_copy)) {
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  849  			dev_err(hdev->dev,
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  850  				"Failed to copy signal seq array from user\n");
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  851  			rc =3D -EFAULT;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  852  			goto free_signal_seq_array;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  853  		}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  854  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  855  		/* currently it is guaranteed to have only one signal s=
eq */
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  856  		signal_seq =3D signal_seq_arr[0];
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  857  		sig_fence =3D hl_ctx_get_fence(ctx, signal_seq);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  858  		if (IS_ERR(sig_fence)) {
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  859  			dev_err(hdev->dev,
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  860  				"Failed to get signal CS with seq 0x%llx\n",
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  861  				signal_seq);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  862  			rc =3D PTR_ERR(sig_fence);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  863  			goto free_signal_seq_array;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  864  		}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  865  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  866  		if (!sig_fence) {
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  867  			/* signal CS already finished */
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  868  			rc =3D 0;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  869  			goto free_signal_seq_array;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  870  		}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  871  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  872  		sig_waitcs_cmpl =3D
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  873  			container_of(sig_fence, struct hl_cs_compl, base_fence=
);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  874  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  875  		if (sig_waitcs_cmpl->type !=3D CS_TYPE_SIGNAL) {
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  876  			dev_err(hdev->dev,
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  877  				"CS seq 0x%llx is not of a signal CS\n",
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  878  				signal_seq);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  879  			dma_fence_put(sig_fence);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  880  			rc =3D -EINVAL;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  881  			goto free_signal_seq_array;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  882  		}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  883  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  884  		if (dma_fence_is_signaled(sig_fence)) {
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  885  			/* signal CS already finished */
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  886  			dma_fence_put(sig_fence);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  887  			rc =3D 0;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  888  			goto free_signal_seq_array;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  889  		}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  890  	}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  891  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  892  	/* increment refcnt for context */
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  893  	hl_ctx_get(hdev, ctx);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  894  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  895  	rc =3D allocate_cs(hdev, ctx, cs_type, &cs);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  896  	if (rc) {
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  897  		if (cs_type =3D=3D CS_TYPE_WAIT)
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  898  			dma_fence_put(sig_fence);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  899  		hl_ctx_put(ctx);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  900  		goto free_signal_seq_array;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  901  	}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  902  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  903  	/*
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  904  	 * Save the signal CS fence for later initialization rig=
ht before
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  905  	 * hanging the wait CS on the queue.
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  906  	 */
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  907  	if (cs->type =3D=3D CS_TYPE_WAIT)
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  908  		cs->signal_fence =3D sig_fence;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  909  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  910  	hl_debugfs_add_cs(cs);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  911  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  912  	*cs_seq =3D cs->sequence;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  913  =

21e7a346344959 drivers/misc/habanalabs/command_submission.c Ofir Bitton    =
 2020-05-14  914  	job =3D hl_cs_allocate_job(hdev, q_type, true);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  915  	if (!job) {
db491e4f08a9fd drivers/misc/habanalabs/command_submission.c Ofir Bitton    =
 2020-06-18  916  		ctx->cs_counters.out_of_mem_drop_cnt++;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  917  		dev_err(hdev->dev, "Failed to allocate a new job\n");
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  918  		rc =3D -ENOMEM;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  919  		goto put_cs;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  920  	}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  921  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  922  	cb =3D hl_cb_kernel_create(hdev, PAGE_SIZE);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  923  	if (!cb) {
db491e4f08a9fd drivers/misc/habanalabs/command_submission.c Ofir Bitton    =
 2020-06-18  924  		ctx->cs_counters.out_of_mem_drop_cnt++;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  925  		kfree(job);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  926  		rc =3D -EFAULT;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  927  		goto put_cs;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  928  	}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  929  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  930  	if (cs->type =3D=3D CS_TYPE_WAIT)
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  931  		cb_size =3D hdev->asic_funcs->get_wait_cb_size(hdev);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  932  	else
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  933  		cb_size =3D hdev->asic_funcs->get_signal_cb_size(hdev);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  934  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  935  	job->id =3D 0;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  936  	job->cs =3D cs;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  937  	job->user_cb =3D cb;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  938  	job->user_cb->cs_cnt++;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  939  	job->user_cb_size =3D cb_size;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  940  	job->hw_queue_id =3D q_idx;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  941  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  942  	/*
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  943  	 * No need in parsing, user CB is the patched CB.
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  944  	 * We call hl_cb_destroy() out of two reasons - we don't=
 need the CB in
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  945  	 * the CB idr anymore and to decrement its refcount as i=
t was
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  946  	 * incremented inside hl_cb_kernel_create().
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  947  	 */
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  948  	job->patched_cb =3D job->user_cb;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  949  	job->job_cb_size =3D job->user_cb_size;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07 @950  	hl_cb_destroy(hdev, &hdev->kernel_cb_mgr, cb->id << PAGE=
_SHIFT);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  951  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  952  	cs->jobs_in_queue_cnt[job->hw_queue_id]++;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  953  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  954  	list_add_tail(&job->cs_node, &cs->job_list);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  955  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  956  	/* increment refcount as for external queues we get comp=
letion */
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  957  	cs_get(cs);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  958  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  959  	hl_debugfs_add_job(hdev, job);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  960  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  961  	rc =3D hl_hw_queue_schedule_cs(cs);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  962  	if (rc) {
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  963  		if (rc !=3D -EAGAIN)
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  964  			dev_err(hdev->dev,
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  965  				"Failed to submit CS %d.%llu to H/W queues, error %d\=
n",
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  966  				ctx->asid, cs->sequence, rc);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  967  		goto free_cs_object;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  968  	}
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  969  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  970  	rc =3D HL_CS_STATUS_SUCCESS;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  971  	goto put_cs;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  972  =

b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  973  free_cs_object:
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  974  	cs_rollback(hdev, cs);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  975  	*cs_seq =3D ULLONG_MAX;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  976  	/* The path below is both for good and erroneous exits */
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  977  put_cs:
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  978  	/* We finished with the CS in this function, so put the =
ref */
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  979  	cs_put(cs);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  980  free_signal_seq_array:
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  981  	if (cs_type =3D=3D CS_TYPE_WAIT)
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  982  		kfree(signal_seq_arr);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  983  free_cs_chunk_array:
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  984  	kfree(cs_chunk_array);
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  985  out:
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  986  	return rc;
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  987  }
b75f22505ac97e drivers/misc/habanalabs/command_submission.c Omer Shpigelman=
 2020-05-07  988  =


:::::: The code at line 950 was first introduced by commit
:::::: b75f22505ac97ea680bcc3e23dcd56f421252b43 habanalabs: add signal/wait=
 to CS IOCTL operations

:::::: TO: Omer Shpigelman <oshpigelman@habana.ai>
:::::: CC: Oded Gabbay <oded.gabbay@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3253876662653700598==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3253876662653700598==--


Content-Type: multipart/mixed; boundary="===============8847702307975845403=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/mpi3mr/mpi3mr_app.c:822 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[mpirep_offset]'
Date: Mon, 30 May 2022 10:56:38 +0800
Message-ID: <202205301004.jQZto0Lo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8847702307975845403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Sumit Saxena <sumit.saxena@broadcom.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Himanshu Madhani <himanshu.madhani@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b00ed48bb0a7c295facf9036135a573a5cdbe7de
commit: 506bc1a0d6ba626492c06e5632a3fbe202770fd2 scsi: mpi3mr: Add support =
for MPT commands
date:   4 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
config: microblaze-randconfig-m031-20220529 (https://download.01.org/0day-c=
i/archive/20220530/202205301004.jQZto0Lo-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_app.c:822 mpi3mr_bsg_process_mpt_cmds() warn: po=
tentially one past the end of array 'drv_bufs[mpirep_offset]'
drivers/scsi/mpi3mr/mpi3mr_app.c:822 mpi3mr_bsg_process_mpt_cmds() warn: po=
tentially one past the end of array 'drv_bufs[mpirep_offset]'
drivers/scsi/mpi3mr/mpi3mr_app.c:852 mpi3mr_bsg_process_mpt_cmds() warn: po=
tentially one past the end of array 'drv_bufs[erb_offset]'

Old smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_app.c:823 mpi3mr_bsg_process_mpt_cmds() warn: po=
tentially one past the end of array 'drv_bufs[mpirep_offset]'

vim +822 drivers/scsi/mpi3mr/mpi3mr_app.c

506bc1a0d6ba62 Sumit Saxena 2022-04-29  448  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  449  /**
506bc1a0d6ba62 Sumit Saxena 2022-04-29  450   * mpi3mr_bsg_process_mpt_cmds=
 - MPI Pass through BSG handler
506bc1a0d6ba62 Sumit Saxena 2022-04-29  451   * @job: BSG job reference
506bc1a0d6ba62 Sumit Saxena 2022-04-29  452   *
506bc1a0d6ba62 Sumit Saxena 2022-04-29  453   * This function is the top le=
vel handler for MPI Pass through
506bc1a0d6ba62 Sumit Saxena 2022-04-29  454   * command, this does basic va=
lidation of the input data buffers,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  455   * identifies the given buffer=
 types and MPI command, allocates
506bc1a0d6ba62 Sumit Saxena 2022-04-29  456   * DMAable memory for user giv=
en buffers, construstcs SGL
506bc1a0d6ba62 Sumit Saxena 2022-04-29  457   * properly and passes the com=
mand to the firmware.
506bc1a0d6ba62 Sumit Saxena 2022-04-29  458   *
506bc1a0d6ba62 Sumit Saxena 2022-04-29  459   * Once the MPI command is com=
pleted the driver copies the data
506bc1a0d6ba62 Sumit Saxena 2022-04-29  460   * if any and reply, sense inf=
ormation to user provided buffers.
506bc1a0d6ba62 Sumit Saxena 2022-04-29  461   * If the command is timed out=
 then issues controller reset
506bc1a0d6ba62 Sumit Saxena 2022-04-29  462   * prior to returning.
506bc1a0d6ba62 Sumit Saxena 2022-04-29  463   *
506bc1a0d6ba62 Sumit Saxena 2022-04-29  464   * Return: 0 on success and pr=
oper error codes on failure
506bc1a0d6ba62 Sumit Saxena 2022-04-29  465   */
506bc1a0d6ba62 Sumit Saxena 2022-04-29  466  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  467  static long mpi3mr_bsg_process=
_mpt_cmds(struct bsg_job *job, unsigned int *reply_payload_rcv_len)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  468  {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  469  	long rval =3D -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  470  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  471  	struct mpi3mr_ioc *mrioc =3D =
NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  472  	u8 *mpi_req =3D NULL, *sense_=
buff_k =3D NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  473  	u8 mpi_msg_size =3D 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  474  	struct mpi3mr_bsg_packet *bsg=
_req =3D NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  475  	struct mpi3mr_bsg_mptcmd *kar=
g;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  476  	struct mpi3mr_buf_entry *buf_=
entries =3D NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  477  	struct mpi3mr_buf_map *drv_bu=
fs =3D NULL, *drv_buf_iter =3D NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  478  	u8 count, bufcnt =3D 0, is_rm=
cb =3D 0, is_rmrb =3D 0, din_cnt =3D 0, dout_cnt =3D 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  479  	u8 invalid_be =3D 0, erb_offs=
et =3D 0xFF, mpirep_offset =3D 0xFF, sg_entries =3D 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  480  	u8 block_io =3D 0, resp_code =
=3D 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  481  	struct mpi3_request_header *m=
pi_header =3D NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  482  	struct mpi3_status_reply_desc=
riptor *status_desc;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  483  	struct mpi3_scsi_task_mgmt_re=
quest *tm_req;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  484  	u32 erbsz =3D MPI3MR_SENSE_BU=
F_SZ, tmplen;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  485  	u16 dev_handle;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  486  	struct mpi3mr_tgt_dev *tgtdev;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  487  	struct mpi3mr_stgt_priv_data =
*stgt_priv =3D NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  488  	struct mpi3mr_bsg_in_reply_bu=
f *bsg_reply_buf =3D NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  489  	u32 din_size =3D 0, dout_size=
 =3D 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  490  	u8 *din_buf =3D NULL, *dout_b=
uf =3D NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  491  	u8 *sgl_iter =3D NULL, *sgl_d=
in_iter =3D NULL, *sgl_dout_iter =3D NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  492  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  493  	bsg_req =3D job->request;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  494  	karg =3D (struct mpi3mr_bsg_m=
ptcmd *)&bsg_req->cmd.mptcmd;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  495  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  496  	mrioc =3D mpi3mr_bsg_verify_a=
dapter(karg->mrioc_id);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  497  	if (!mrioc)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  498  		return -ENODEV;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  499  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  500  	if (karg->timeout < MPI3MR_AP=
P_DEFAULT_TIMEOUT)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  501  		karg->timeout =3D MPI3MR_APP=
_DEFAULT_TIMEOUT;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  502  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  503  	mpi_req =3D kzalloc(MPI3MR_AD=
MIN_REQ_FRAME_SZ, GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  504  	if (!mpi_req)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  505  		return -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  506  	mpi_header =3D (struct mpi3_r=
equest_header *)mpi_req;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  507  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  508  	bufcnt =3D karg->buf_entry_li=
st.num_of_entries;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  509  	drv_bufs =3D kzalloc((sizeof(=
*drv_bufs) * bufcnt), GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  510  	if (!drv_bufs) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  511  		rval =3D -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  512  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  513  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  514  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  515  	dout_buf =3D kzalloc(job->req=
uest_payload.payload_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  516  				      GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  517  	if (!dout_buf) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  518  		rval =3D -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  519  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  520  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  521  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  522  	din_buf =3D kzalloc(job->repl=
y_payload.payload_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  523  				     GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  524  	if (!din_buf) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  525  		rval =3D -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  526  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  527  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  528  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  529  	sg_copy_to_buffer(job->reques=
t_payload.sg_list,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  530  			  job->request_payload.sg_c=
nt,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  531  			  dout_buf, job->request_pa=
yload.payload_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  532  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  533  	buf_entries =3D karg->buf_ent=
ry_list.buf_entry;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  534  	sgl_din_iter =3D din_buf;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  535  	sgl_dout_iter =3D dout_buf;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  536  	drv_buf_iter =3D drv_bufs;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  537  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  538  	for (count =3D 0; count < buf=
cnt; count++, buf_entries++, drv_buf_iter++) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  539  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  540  		if (sgl_dout_iter > (dout_bu=
f + job->request_payload.payload_len)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  541  			dprint_bsg_err(mrioc, "%s: =
data_out buffer length mismatch\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  542  				__func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  543  			rval =3D -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  544  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  545  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  546  		if (sgl_din_iter > (din_buf =
+ job->reply_payload.payload_len)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  547  			dprint_bsg_err(mrioc, "%s: =
data_in buffer length mismatch\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  548  				__func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  549  			rval =3D -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  550  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  551  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  552  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  553  		switch (buf_entries->buf_typ=
e) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  554  		case MPI3MR_BSG_BUFTYPE_RAID=
MGMT_CMD:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  555  			sgl_iter =3D sgl_dout_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  556  			sgl_dout_iter +=3D buf_entr=
ies->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  557  			drv_buf_iter->data_dir =3D =
DMA_TO_DEVICE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  558  			is_rmcb =3D 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  559  			if (count !=3D 0)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  560  				invalid_be =3D 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  561  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  562  		case MPI3MR_BSG_BUFTYPE_RAID=
MGMT_RESP:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  563  			sgl_iter =3D sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  564  			sgl_din_iter +=3D buf_entri=
es->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  565  			drv_buf_iter->data_dir =3D =
DMA_FROM_DEVICE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  566  			is_rmrb =3D 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  567  			if (count !=3D 1 || !is_rmc=
b)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  568  				invalid_be =3D 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  569  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  570  		case MPI3MR_BSG_BUFTYPE_DATA=
_IN:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  571  			sgl_iter =3D sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  572  			sgl_din_iter +=3D buf_entri=
es->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  573  			drv_buf_iter->data_dir =3D =
DMA_FROM_DEVICE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  574  			din_cnt++;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  575  			din_size +=3D drv_buf_iter-=
>bsg_buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  576  			if ((din_cnt > 1) && !is_rm=
cb)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  577  				invalid_be =3D 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  578  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  579  		case MPI3MR_BSG_BUFTYPE_DATA=
_OUT:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  580  			sgl_iter =3D sgl_dout_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  581  			sgl_dout_iter +=3D buf_entr=
ies->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  582  			drv_buf_iter->data_dir =3D =
DMA_TO_DEVICE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  583  			dout_cnt++;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  584  			dout_size +=3D drv_buf_iter=
->bsg_buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  585  			if ((dout_cnt > 1) && !is_r=
mcb)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  586  				invalid_be =3D 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  587  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  588  		case MPI3MR_BSG_BUFTYPE_MPI_=
REPLY:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  589  			sgl_iter =3D sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  590  			sgl_din_iter +=3D buf_entri=
es->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  591  			drv_buf_iter->data_dir =3D =
DMA_NONE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  592  			mpirep_offset =3D count;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  593  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  594  		case MPI3MR_BSG_BUFTYPE_ERR_=
RESPONSE:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  595  			sgl_iter =3D sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  596  			sgl_din_iter +=3D buf_entri=
es->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  597  			drv_buf_iter->data_dir =3D =
DMA_NONE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  598  			erb_offset =3D count;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  599  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  600  		case MPI3MR_BSG_BUFTYPE_MPI_=
REQUEST:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  601  			sgl_iter =3D sgl_dout_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  602  			sgl_dout_iter +=3D buf_entr=
ies->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  603  			drv_buf_iter->data_dir =3D =
DMA_NONE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  604  			mpi_msg_size =3D buf_entrie=
s->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  605  			if ((!mpi_msg_size || (mpi_=
msg_size % 4)) ||
506bc1a0d6ba62 Sumit Saxena 2022-04-29  606  					(mpi_msg_size > MPI3MR_AD=
MIN_REQ_FRAME_SZ)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  607  				dprint_bsg_err(mrioc, "%s:=
 invalid MPI message size\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  608  					__func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  609  				rval =3D -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  610  				goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  611  			}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  612  			memcpy(mpi_req, sgl_iter, b=
uf_entries->buf_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  613  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  614  		default:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  615  			invalid_be =3D 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  616  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  617  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  618  		if (invalid_be) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  619  			dprint_bsg_err(mrioc, "%s: =
invalid buffer entries passed\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  620  				__func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  621  			rval =3D -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  622  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  623  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  624  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  625  		drv_buf_iter->bsg_buf =3D sg=
l_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  626  		drv_buf_iter->bsg_buf_len =
=3D buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  627  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  628  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  629  	if (!is_rmcb && (dout_cnt || =
din_cnt)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  630  		sg_entries =3D dout_cnt + di=
n_cnt;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  631  		if (((mpi_msg_size) + (sg_en=
tries *
506bc1a0d6ba62 Sumit Saxena 2022-04-29  632  		      sizeof(struct mpi3_sge=
_common))) > MPI3MR_ADMIN_REQ_FRAME_SZ) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  633  			dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  634  			    "%s:%d: invalid message=
 size passed\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  635  			    __func__, __LINE__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  636  			rval =3D -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  637  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  638  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  639  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  640  	if (din_size > MPI3MR_MAX_APP=
_XFER_SIZE) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  641  		dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  642  		    "%s:%d: invalid data tra=
nsfer size passed for function 0x%x din_size=3D%d\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  643  		    __func__, __LINE__, mpi_=
header->function, din_size);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  644  		rval =3D -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  645  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  646  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  647  	if (dout_size > MPI3MR_MAX_AP=
P_XFER_SIZE) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  648  		dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  649  		    "%s:%d: invalid data tra=
nsfer size passed for function 0x%x dout_size =3D %d\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  650  		    __func__, __LINE__, mpi_=
header->function, dout_size);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  651  		rval =3D -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  652  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  653  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  654  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  655  	drv_buf_iter =3D drv_bufs;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  656  	for (count =3D 0; count < buf=
cnt; count++, drv_buf_iter++) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  657  		if (drv_buf_iter->data_dir =
=3D=3D DMA_NONE)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  658  			continue;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  659  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  660  		drv_buf_iter->kern_buf_len =
=3D drv_buf_iter->bsg_buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  661  		if (is_rmcb && !count)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  662  			drv_buf_iter->kern_buf_len =
+=3D ((dout_cnt + din_cnt) *
506bc1a0d6ba62 Sumit Saxena 2022-04-29  663  			    sizeof(struct mpi3_sge_=
common));
506bc1a0d6ba62 Sumit Saxena 2022-04-29  664  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  665  		if (!drv_buf_iter->kern_buf_=
len)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  666  			continue;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  667  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  668  		drv_buf_iter->kern_buf =3D d=
ma_alloc_coherent(&mrioc->pdev->dev,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  669  		    drv_buf_iter->kern_buf_l=
en, &drv_buf_iter->kern_buf_dma,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  670  		    GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  671  		if (!drv_buf_iter->kern_buf)=
 {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  672  			rval =3D -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  673  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  674  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  675  		if (drv_buf_iter->data_dir =
=3D=3D DMA_TO_DEVICE) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  676  			tmplen =3D min(drv_buf_iter=
->kern_buf_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  677  			    drv_buf_iter->bsg_buf_l=
en);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  678  			memcpy(drv_buf_iter->kern_b=
uf, drv_buf_iter->bsg_buf, tmplen);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  679  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  680  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  681  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  682  	if (erb_offset !=3D 0xFF) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  683  		sense_buff_k =3D kzalloc(erb=
sz, GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  684  		if (!sense_buff_k) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  685  			rval =3D -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  686  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  687  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  688  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  689  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  690  	if (mutex_lock_interruptible(=
&mrioc->bsg_cmds.mutex)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  691  		rval =3D -ERESTARTSYS;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  692  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  693  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  694  	if (mrioc->bsg_cmds.state & M=
PI3MR_CMD_PENDING) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  695  		rval =3D -EAGAIN;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  696  		dprint_bsg_err(mrioc, "%s: c=
ommand is in use\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  697  		mutex_unlock(&mrioc->bsg_cmd=
s.mutex);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  698  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  699  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  700  	if (mrioc->unrecoverable) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  701  		dprint_bsg_err(mrioc, "%s: u=
nrecoverable controller\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  702  		    __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  703  		rval =3D -EFAULT;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  704  		mutex_unlock(&mrioc->bsg_cmd=
s.mutex);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  705  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  706  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  707  	if (mrioc->reset_in_progress)=
 {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  708  		dprint_bsg_err(mrioc, "%s: r=
eset in progress\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  709  		rval =3D -EAGAIN;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  710  		mutex_unlock(&mrioc->bsg_cmd=
s.mutex);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  711  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  712  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  713  	if (mrioc->stop_bsgs) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  714  		dprint_bsg_err(mrioc, "%s: b=
sgs are blocked\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  715  		rval =3D -EAGAIN;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  716  		mutex_unlock(&mrioc->bsg_cmd=
s.mutex);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  717  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  718  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  719  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  720  	if (mpi_header->function !=3D=
 MPI3_BSG_FUNCTION_NVME_ENCAPSULATED) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  721  		mpi3mr_bsg_build_sgl(mpi_req=
, (mpi_msg_size),
506bc1a0d6ba62 Sumit Saxena 2022-04-29  722  		    drv_bufs, bufcnt, is_rmc=
b, is_rmrb,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  723  		    (dout_cnt + din_cnt));
506bc1a0d6ba62 Sumit Saxena 2022-04-29  724  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  725  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  726  	if (mpi_header->function =3D=
=3D MPI3_BSG_FUNCTION_SCSI_TASK_MGMT) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  727  		tm_req =3D (struct mpi3_scsi=
_task_mgmt_request *)mpi_req;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  728  		if (tm_req->task_type !=3D
506bc1a0d6ba62 Sumit Saxena 2022-04-29  729  		    MPI3_SCSITASKMGMT_TASKTY=
PE_ABORT_TASK) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  730  			dev_handle =3D tm_req->dev_=
handle;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  731  			block_io =3D 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  732  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  733  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  734  	if (block_io) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  735  		tgtdev =3D mpi3mr_get_tgtdev=
_by_handle(mrioc, dev_handle);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  736  		if (tgtdev && tgtdev->starge=
t && tgtdev->starget->hostdata) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  737  			stgt_priv =3D (struct mpi3m=
r_stgt_priv_data *)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  738  			    tgtdev->starget->hostda=
ta;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  739  			atomic_inc(&stgt_priv->bloc=
k_io);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  740  			mpi3mr_tgtdev_put(tgtdev);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  741  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  742  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  743  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  744  	mrioc->bsg_cmds.state =3D MPI=
3MR_CMD_PENDING;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  745  	mrioc->bsg_cmds.is_waiting =
=3D 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  746  	mrioc->bsg_cmds.callback =3D =
NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  747  	mrioc->bsg_cmds.is_sense =3D =
0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  748  	mrioc->bsg_cmds.sensebuf =3D =
sense_buff_k;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  749  	memset(mrioc->bsg_cmds.reply,=
 0, mrioc->reply_sz);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  750  	mpi_header->host_tag =3D cpu_=
to_le16(MPI3MR_HOSTTAG_BSG_CMDS);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  751  	if (mrioc->logging_level & MP=
I3_DEBUG_BSG_INFO) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  752  		dprint_bsg_info(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  753  		    "%s: posting bsg request=
 to the controller\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  754  		dprint_dump(mpi_req, MPI3MR_=
ADMIN_REQ_FRAME_SZ,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  755  		    "bsg_mpi3_req");
506bc1a0d6ba62 Sumit Saxena 2022-04-29  756  		if (mpi_header->function =3D=
=3D MPI3_BSG_FUNCTION_MGMT_PASSTHROUGH) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  757  			drv_buf_iter =3D &drv_bufs[=
0];
506bc1a0d6ba62 Sumit Saxena 2022-04-29  758  			dprint_dump(drv_buf_iter->k=
ern_buf,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  759  			    drv_buf_iter->kern_buf_=
len, "mpi3_mgmt_req");
506bc1a0d6ba62 Sumit Saxena 2022-04-29  760  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  761  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  762  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  763  	init_completion(&mrioc->bsg_c=
mds.done);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  764  	rval =3D mpi3mr_admin_request=
_post(mrioc, mpi_req,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  765  	    MPI3MR_ADMIN_REQ_FRAME_SZ=
, 0);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  766  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  767  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  768  	if (rval) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  769  		mrioc->bsg_cmds.is_waiting =
=3D 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  770  		dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  771  		    "%s: posting bsg request=
 is failed\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  772  		rval =3D -EAGAIN;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  773  		goto out_unlock;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  774  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  775  	wait_for_completion_timeout(&=
mrioc->bsg_cmds.done,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  776  	    (karg->timeout * HZ));
506bc1a0d6ba62 Sumit Saxena 2022-04-29  777  	if (block_io && stgt_priv)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  778  		atomic_dec(&stgt_priv->block=
_io);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  779  	if (!(mrioc->bsg_cmds.state &=
 MPI3MR_CMD_COMPLETE)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  780  		mrioc->bsg_cmds.is_waiting =
=3D 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  781  		rval =3D -EAGAIN;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  782  		if (mrioc->bsg_cmds.state & =
MPI3MR_CMD_RESET)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  783  			goto out_unlock;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  784  		dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  785  		    "%s: bsg request timedou=
t after %d seconds\n", __func__,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  786  		    karg->timeout);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  787  		if (mrioc->logging_level & M=
PI3_DEBUG_BSG_ERROR) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  788  			dprint_dump(mpi_req, MPI3MR=
_ADMIN_REQ_FRAME_SZ,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  789  			    "bsg_mpi3_req");
506bc1a0d6ba62 Sumit Saxena 2022-04-29  790  			if (mpi_header->function =
=3D=3D
506bc1a0d6ba62 Sumit Saxena 2022-04-29  791  			    MPI3_BSG_FUNCTION_MGMT_=
PASSTHROUGH) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  792  				drv_buf_iter =3D &drv_bufs=
[0];
506bc1a0d6ba62 Sumit Saxena 2022-04-29  793  				dprint_dump(drv_buf_iter->=
kern_buf,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  794  				    drv_buf_iter->kern_buf=
_len, "mpi3_mgmt_req");
506bc1a0d6ba62 Sumit Saxena 2022-04-29  795  			}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  796  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  797  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  798  		if (mpi_header->function =3D=
=3D MPI3_BSG_FUNCTION_SCSI_IO)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  799  			mpi3mr_issue_tm(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  800  			    MPI3_SCSITASKMGMT_TASKT=
YPE_TARGET_RESET,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  801  			    mpi_header->function_de=
pendent, 0,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  802  			    MPI3MR_HOSTTAG_BLK_TMS,=
 MPI3MR_RESETTM_TIMEOUT,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  803  			    &mrioc->host_tm_cmds, &=
resp_code, NULL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  804  		if (!(mrioc->bsg_cmds.state =
& MPI3MR_CMD_COMPLETE) &&
506bc1a0d6ba62 Sumit Saxena 2022-04-29  805  		    !(mrioc->bsg_cmds.state =
& MPI3MR_CMD_RESET))
506bc1a0d6ba62 Sumit Saxena 2022-04-29  806  			mpi3mr_soft_reset_handler(m=
rioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  807  			    MPI3MR_RESET_FROM_APP_T=
IMEOUT, 1);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  808  		goto out_unlock;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  809  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  810  	dprint_bsg_info(mrioc, "%s: b=
sg request is completed\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  811  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  812  	if ((mrioc->bsg_cmds.ioc_stat=
us & MPI3_IOCSTATUS_STATUS_MASK)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  813  	     !=3D MPI3_IOCSTATUS_SUCC=
ESS) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  814  		dprint_bsg_info(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  815  		    "%s: command failed, ioc=
_status(0x%04x) log_info(0x%08x)\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  816  		    __func__,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  817  		    (mrioc->bsg_cmds.ioc_sta=
tus & MPI3_IOCSTATUS_STATUS_MASK),
506bc1a0d6ba62 Sumit Saxena 2022-04-29  818  		    mrioc->bsg_cmds.ioc_logi=
nfo);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  819  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  820  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  821  	if ((mpirep_offset !=3D 0xFF)=
 &&
506bc1a0d6ba62 Sumit Saxena 2022-04-29 @822  	    drv_bufs[mpirep_offset].b=
sg_buf_len) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  823  		drv_buf_iter =3D &drv_bufs[m=
pirep_offset];
506bc1a0d6ba62 Sumit Saxena 2022-04-29  824  		drv_buf_iter->kern_buf_len =
=3D (sizeof(*bsg_reply_buf) - 1 +
506bc1a0d6ba62 Sumit Saxena 2022-04-29  825  					   mrioc->reply_sz);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  826  		bsg_reply_buf =3D kzalloc(dr=
v_buf_iter->kern_buf_len, GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  827  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  828  		if (!bsg_reply_buf) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  829  			rval =3D -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  830  			goto out_unlock;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  831  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  832  		if (mrioc->bsg_cmds.state & =
MPI3MR_CMD_REPLY_VALID) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  833  			bsg_reply_buf->mpi_reply_ty=
pe =3D
506bc1a0d6ba62 Sumit Saxena 2022-04-29  834  				MPI3MR_BSG_MPI_REPLY_BUFTY=
PE_ADDRESS;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  835  			memcpy(bsg_reply_buf->reply=
_buf,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  836  			    mrioc->bsg_cmds.reply, =
mrioc->reply_sz);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  837  		} else {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  838  			bsg_reply_buf->mpi_reply_ty=
pe =3D
506bc1a0d6ba62 Sumit Saxena 2022-04-29  839  				MPI3MR_BSG_MPI_REPLY_BUFTY=
PE_STATUS;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  840  			status_desc =3D (struct mpi=
3_status_reply_descriptor *)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  841  			    bsg_reply_buf->reply_bu=
f;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  842  			status_desc->ioc_status =3D=
 mrioc->bsg_cmds.ioc_status;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  843  			status_desc->ioc_log_info =
=3D mrioc->bsg_cmds.ioc_loginfo;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  844  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  845  		tmplen =3D min(drv_buf_iter-=
>kern_buf_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  846  			drv_buf_iter->bsg_buf_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  847  		memcpy(drv_buf_iter->bsg_buf=
, bsg_reply_buf, tmplen);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  848  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  849  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  850  	if (erb_offset !=3D 0xFF && m=
rioc->bsg_cmds.sensebuf &&
506bc1a0d6ba62 Sumit Saxena 2022-04-29  851  	    mrioc->bsg_cmds.is_sense)=
 {
506bc1a0d6ba62 Sumit Saxena 2022-04-29 @852  		drv_buf_iter =3D &drv_bufs[e=
rb_offset];
506bc1a0d6ba62 Sumit Saxena 2022-04-29  853  		tmplen =3D min(erbsz, drv_bu=
f_iter->bsg_buf_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  854  		memcpy(drv_buf_iter->bsg_buf=
, sense_buff_k, tmplen);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  855  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  856  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  857  	drv_buf_iter =3D drv_bufs;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  858  	for (count =3D 0; count < buf=
cnt; count++, drv_buf_iter++) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  859  		if (drv_buf_iter->data_dir =
=3D=3D DMA_NONE)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  860  			continue;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  861  		if (drv_buf_iter->data_dir =
=3D=3D DMA_FROM_DEVICE) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  862  			tmplen =3D min(drv_buf_iter=
->kern_buf_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  863  				     drv_buf_iter->bsg_buf=
_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  864  			memcpy(drv_buf_iter->bsg_bu=
f,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  865  			       drv_buf_iter->kern_b=
uf, tmplen);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  866  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  867  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  868  =

506bc1a0d6ba62 Sumit Saxena 2022-04-29  869  out_unlock:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  870  	if (din_buf) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  871  		*reply_payload_rcv_len =3D
506bc1a0d6ba62 Sumit Saxena 2022-04-29  872  			sg_copy_from_buffer(job->re=
ply_payload.sg_list,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  873  					    job->reply_payload.sg=
_cnt,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  874  					    din_buf, job->reply_p=
ayload.payload_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  875  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  876  	mrioc->bsg_cmds.is_sense =3D =
0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  877  	mrioc->bsg_cmds.sensebuf =3D =
NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  878  	mrioc->bsg_cmds.state =3D MPI=
3MR_CMD_NOTUSED;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  879  	mutex_unlock(&mrioc->bsg_cmds=
.mutex);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  880  out:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  881  	kfree(sense_buff_k);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  882  	kfree(dout_buf);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  883  	kfree(din_buf);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  884  	kfree(mpi_req);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  885  	if (drv_bufs) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  886  		drv_buf_iter =3D drv_bufs;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  887  		for (count =3D 0; count < bu=
fcnt; count++, drv_buf_iter++) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  888  			if (drv_buf_iter->kern_buf =
&& drv_buf_iter->kern_buf_dma)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  889  				dma_free_coherent(&mrioc->=
pdev->dev,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  890  				    drv_buf_iter->kern_buf=
_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  891  				    drv_buf_iter->kern_buf,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  892  				    drv_buf_iter->kern_buf=
_dma);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  893  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  894  		kfree(drv_bufs);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  895  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  896  	kfree(bsg_reply_buf);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  897  	return rval;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  898  }
506bc1a0d6ba62 Sumit Saxena 2022-04-29  899  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8847702307975845403==--


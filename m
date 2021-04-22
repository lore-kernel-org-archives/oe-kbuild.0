Content-Type: multipart/mixed; boundary="===============9104277029946452305=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hare-scsi-devel:scsi-result-rework 8/146] drivers/scsi/sg.c:501 sg_read() warn: this array is probably non-NULL. 'srp->sense_b'
Date: Thu, 22 Apr 2021 08:29:30 +0800
Message-ID: <202104220810.pz8bouWV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9104277029946452305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git=
 scsi-result-rework
head:   19720ea7b22b443a182646eef7edc36e32e7b515
commit: 650e66d86e623824cc550f1b8411951116a6b6ea [8/146] scsi: Kill DRIVER_=
SENSE
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021-20210421 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/scsi/sg.c:501 sg_read() warn: this array is probably non-NULL. 'srp=
->sense_b'
drivers/scsi/sg.c:579 sg_new_read() warn: this array is probably non-NULL. =
'srp->sense_b'

Old smatch warnings:
drivers/scsi/sg.c:484 sg_read() error: we previously assumed 'srp' could be=
 null (see line 470)
drivers/scsi/sg.c:1100 sg_ioctl_common() warn: inconsistent indenting

vim +501 drivers/scsi/sg.c

78ed001d9e7106 Arnd Bergmann   2019-12-04  439  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  440  static ssize_t
^1da177e4c3f41 Linus Torvalds  2005-04-16  441  sg_read(struct file *filp, =
char __user *buf, size_t count, loff_t * ppos)
^1da177e4c3f41 Linus Torvalds  2005-04-16  442  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  443  	Sg_device *sdp;
^1da177e4c3f41 Linus Torvalds  2005-04-16  444  	Sg_fd *sfp;
^1da177e4c3f41 Linus Torvalds  2005-04-16  445  	Sg_request *srp;
^1da177e4c3f41 Linus Torvalds  2005-04-16  446  	int req_pack_id =3D -1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  447  	sg_io_hdr_t *hp;
78ed001d9e7106 Arnd Bergmann   2019-12-04  448  	struct sg_header *old_hdr;
78ed001d9e7106 Arnd Bergmann   2019-12-04  449  	int retval;
^1da177e4c3f41 Linus Torvalds  2005-04-16  450  =

26b5b874aff565 Jann Horn       2018-06-25  451  	/*
26b5b874aff565 Jann Horn       2018-06-25  452  	 * This could cause a resp=
onse to be stranded. Close the associated
26b5b874aff565 Jann Horn       2018-06-25  453  	 * file descriptor to free=
 up any resources being held.
26b5b874aff565 Jann Horn       2018-06-25  454  	 */
26b5b874aff565 Jann Horn       2018-06-25  455  	retval =3D sg_check_file_a=
ccess(filp, __func__);
26b5b874aff565 Jann Horn       2018-06-25  456  	if (retval)
26b5b874aff565 Jann Horn       2018-06-25  457  		return retval;
26b5b874aff565 Jann Horn       2018-06-25  458  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  459  	if ((!(sfp =3D (Sg_fd *) f=
ilp->private_data)) || (!(sdp =3D sfp->parentdp)))
^1da177e4c3f41 Linus Torvalds  2005-04-16  460  		return -ENXIO;
95e159d6dd808b Hannes Reinecke 2014-06-25  461  	SCSI_LOG_TIMEOUT(3, sg_pri=
ntk(KERN_INFO, sdp,
95e159d6dd808b Hannes Reinecke 2014-06-25  462  				      "sg_read: count=
=3D%d\n", (int) count));
d6b10348f93979 Mike Christie   2005-11-08  463  =

78ed001d9e7106 Arnd Bergmann   2019-12-04  464  	if (sfp->force_packid)
78ed001d9e7106 Arnd Bergmann   2019-12-04  465  		retval =3D get_sg_io_pack=
_id(&req_pack_id, buf, count);
78ed001d9e7106 Arnd Bergmann   2019-12-04  466  	if (retval)
78ed001d9e7106 Arnd Bergmann   2019-12-04  467  		return retval;
78ed001d9e7106 Arnd Bergmann   2019-12-04  468  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  469  	srp =3D sg_get_rq_mark(sfp=
, req_pack_id);
^1da177e4c3f41 Linus Torvalds  2005-04-16  470  	if (!srp) {		/* now wait o=
n packet to arrive */
78ed001d9e7106 Arnd Bergmann   2019-12-04  471  		if (atomic_read(&sdp->det=
aching))
78ed001d9e7106 Arnd Bergmann   2019-12-04  472  			return -ENODEV;
78ed001d9e7106 Arnd Bergmann   2019-12-04  473  		if (filp->f_flags & O_NON=
BLOCK)
78ed001d9e7106 Arnd Bergmann   2019-12-04  474  			return -EAGAIN;
3f0c6aba0b65a6 J=C3=B6rn Engel      2012-04-12  475  		retval =3D wait_even=
t_interruptible(sfp->read_wait,
cc833acbee9db5 Douglas Gilbert 2014-06-25  476  			(atomic_read(&sdp->detac=
hing) ||
3f0c6aba0b65a6 J=C3=B6rn Engel      2012-04-12  477  			(srp =3D sg_get_rq_=
mark(sfp, req_pack_id))));
78ed001d9e7106 Arnd Bergmann   2019-12-04  478  		if (atomic_read(&sdp->det=
aching))
78ed001d9e7106 Arnd Bergmann   2019-12-04  479  			return -ENODEV;
78ed001d9e7106 Arnd Bergmann   2019-12-04  480  		if (retval)
cb59e840838193 Douglas Gilbert 2005-04-02  481  			/* -ERESTARTSYS as signa=
l hit process */
78ed001d9e7106 Arnd Bergmann   2019-12-04  482  			return retval;
^1da177e4c3f41 Linus Torvalds  2005-04-16  483  	}
78ed001d9e7106 Arnd Bergmann   2019-12-04  484  	if (srp->header.interface_=
id !=3D '\0')
78ed001d9e7106 Arnd Bergmann   2019-12-04  485  		return sg_new_read(sfp, b=
uf, count, srp);
^1da177e4c3f41 Linus Torvalds  2005-04-16  486  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  487  	hp =3D &srp->header;
78ed001d9e7106 Arnd Bergmann   2019-12-04  488  	old_hdr =3D kzalloc(SZ_SG_=
HEADER, GFP_KERNEL);
78ed001d9e7106 Arnd Bergmann   2019-12-04  489  	if (!old_hdr)
78ed001d9e7106 Arnd Bergmann   2019-12-04  490  		return -ENOMEM;
78ed001d9e7106 Arnd Bergmann   2019-12-04  491  =

cb59e840838193 Douglas Gilbert 2005-04-02  492  	old_hdr->reply_len =3D (in=
t) hp->timeout;
cb59e840838193 Douglas Gilbert 2005-04-02  493  	old_hdr->pack_len =3D old_=
hdr->reply_len; /* old, strange behaviour */
cb59e840838193 Douglas Gilbert 2005-04-02  494  	old_hdr->pack_id =3D hp->p=
ack_id;
cb59e840838193 Douglas Gilbert 2005-04-02  495  	old_hdr->twelve_byte =3D
^1da177e4c3f41 Linus Torvalds  2005-04-16  496  	    ((srp->data.cmd_opcode=
 >=3D 0xc0) && (12 =3D=3D hp->cmd_len)) ? 1 : 0;
cb59e840838193 Douglas Gilbert 2005-04-02  497  	old_hdr->target_status =3D=
 hp->masked_status;
cb59e840838193 Douglas Gilbert 2005-04-02  498  	old_hdr->host_status =3D h=
p->host_status;
cb59e840838193 Douglas Gilbert 2005-04-02  499  	old_hdr->driver_status =3D=
 hp->driver_status;
^1da177e4c3f41 Linus Torvalds  2005-04-16  500  	if ((CHECK_CONDITION & hp-=
>masked_status) ||
650e66d86e6238 Hannes Reinecke 2019-10-21 @501  	    (srp->sense_b && (srp-=
>sense_b[0] & 0x70) =3D=3D 0x70)) {
650e66d86e6238 Hannes Reinecke 2019-10-21  502  		old_hdr->driver_status |=
=3D DRIVER_SENSE;
cb59e840838193 Douglas Gilbert 2005-04-02  503  		memcpy(old_hdr->sense_buf=
fer, srp->sense_b,
cb59e840838193 Douglas Gilbert 2005-04-02  504  		       sizeof (old_hdr->s=
ense_buffer));
650e66d86e6238 Hannes Reinecke 2019-10-21  505  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  506  	switch (hp->host_status) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  507  	/* This setup of 'result' =
is for backward compatibility and is best
^1da177e4c3f41 Linus Torvalds  2005-04-16  508  	   ignored by the user who=
 should use target, host + driver status */
^1da177e4c3f41 Linus Torvalds  2005-04-16  509  	case DID_OK:
^1da177e4c3f41 Linus Torvalds  2005-04-16  510  	case DID_PASSTHROUGH:
^1da177e4c3f41 Linus Torvalds  2005-04-16  511  	case DID_SOFT_ERROR:
cb59e840838193 Douglas Gilbert 2005-04-02  512  		old_hdr->result =3D 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  513  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  514  	case DID_NO_CONNECT:
^1da177e4c3f41 Linus Torvalds  2005-04-16  515  	case DID_BUS_BUSY:
^1da177e4c3f41 Linus Torvalds  2005-04-16  516  	case DID_TIME_OUT:
cb59e840838193 Douglas Gilbert 2005-04-02  517  		old_hdr->result =3D EBUSY;
^1da177e4c3f41 Linus Torvalds  2005-04-16  518  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  519  	case DID_BAD_TARGET:
^1da177e4c3f41 Linus Torvalds  2005-04-16  520  	case DID_ABORT:
^1da177e4c3f41 Linus Torvalds  2005-04-16  521  	case DID_PARITY:
^1da177e4c3f41 Linus Torvalds  2005-04-16  522  	case DID_RESET:
^1da177e4c3f41 Linus Torvalds  2005-04-16  523  	case DID_BAD_INTR:
cb59e840838193 Douglas Gilbert 2005-04-02  524  		old_hdr->result =3D EIO;
^1da177e4c3f41 Linus Torvalds  2005-04-16  525  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  526  	case DID_ERROR:
cb59e840838193 Douglas Gilbert 2005-04-02  527  		old_hdr->result =3D (srp-=
>sense_b[0] =3D=3D 0 && =

^1da177e4c3f41 Linus Torvalds  2005-04-16  528  				  hp->masked_status =3D=
=3D GOOD) ? 0 : EIO;
^1da177e4c3f41 Linus Torvalds  2005-04-16  529  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  530  	default:
cb59e840838193 Douglas Gilbert 2005-04-02  531  		old_hdr->result =3D EIO;
^1da177e4c3f41 Linus Torvalds  2005-04-16  532  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  533  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  534  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  535  	/* Now copy the result bac=
k to the user buffer.  */
^1da177e4c3f41 Linus Torvalds  2005-04-16  536  	if (count >=3D SZ_SG_HEADE=
R) {
c8c12792d5fe11 Al Viro         2019-10-17  537  		if (copy_to_user(buf, old=
_hdr, SZ_SG_HEADER)) {
cb59e840838193 Douglas Gilbert 2005-04-02  538  			retval =3D -EFAULT;
cb59e840838193 Douglas Gilbert 2005-04-02  539  			goto free_old_hdr;
cb59e840838193 Douglas Gilbert 2005-04-02  540  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  541  		buf +=3D SZ_SG_HEADER;
cb59e840838193 Douglas Gilbert 2005-04-02  542  		if (count > old_hdr->repl=
y_len)
cb59e840838193 Douglas Gilbert 2005-04-02  543  			count =3D old_hdr->reply=
_len;
^1da177e4c3f41 Linus Torvalds  2005-04-16  544  		if (count > SZ_SG_HEADER)=
 {
cb59e840838193 Douglas Gilbert 2005-04-02  545  			if (sg_read_oxfer(srp, b=
uf, count - SZ_SG_HEADER)) {
cb59e840838193 Douglas Gilbert 2005-04-02  546  				retval =3D -EFAULT;
cb59e840838193 Douglas Gilbert 2005-04-02  547  				goto free_old_hdr;
cb59e840838193 Douglas Gilbert 2005-04-02  548  			}
^1da177e4c3f41 Linus Torvalds  2005-04-16  549  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  550  	} else
cb59e840838193 Douglas Gilbert 2005-04-02  551  		count =3D (old_hdr->resul=
t =3D=3D 0) ? 0 : -EIO;
^1da177e4c3f41 Linus Torvalds  2005-04-16  552  	sg_finish_rem_req(srp);
97d27b0dd015e9 Hannes Reinecke 2017-04-07  553  	sg_remove_request(sfp, srp=
);
cb59e840838193 Douglas Gilbert 2005-04-02  554  	retval =3D count;
cb59e840838193 Douglas Gilbert 2005-04-02  555  free_old_hdr:
cb59e840838193 Douglas Gilbert 2005-04-02  556  	kfree(old_hdr);
cb59e840838193 Douglas Gilbert 2005-04-02  557  	return retval;
^1da177e4c3f41 Linus Torvalds  2005-04-16  558  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  559  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  560  static ssize_t
^1da177e4c3f41 Linus Torvalds  2005-04-16  561  sg_new_read(Sg_fd * sfp, ch=
ar __user *buf, size_t count, Sg_request * srp)
^1da177e4c3f41 Linus Torvalds  2005-04-16  562  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  563  	sg_io_hdr_t *hp =3D &srp->=
header;
3b524a683af899 Tony Battersby  2015-02-11  564  	int err =3D 0, err2;
^1da177e4c3f41 Linus Torvalds  2005-04-16  565  	int len;
^1da177e4c3f41 Linus Torvalds  2005-04-16  566  =

78ed001d9e7106 Arnd Bergmann   2019-12-04  567  	if (in_compat_syscall()) {
78ed001d9e7106 Arnd Bergmann   2019-12-04  568  		if (count < sizeof(struct=
 compat_sg_io_hdr)) {
78ed001d9e7106 Arnd Bergmann   2019-12-04  569  			err =3D -EINVAL;
78ed001d9e7106 Arnd Bergmann   2019-12-04  570  			goto err_out;
78ed001d9e7106 Arnd Bergmann   2019-12-04  571  		}
78ed001d9e7106 Arnd Bergmann   2019-12-04  572  	} else if (count < SZ_SG_I=
O_HDR) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  573  		err =3D -EINVAL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  574  		goto err_out;
^1da177e4c3f41 Linus Torvalds  2005-04-16  575  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  576  	hp->sb_len_wr =3D 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  577  	if ((hp->mx_sb_len > 0) &&=
 hp->sbp) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  578  		if ((CHECK_CONDITION & hp=
->masked_status) ||
650e66d86e6238 Hannes Reinecke 2019-10-21 @579  		    (srp->sense_b && (srp=
->sense_b[0] & 0x70) =3D=3D 0x70)) {
d6b10348f93979 Mike Christie   2005-11-08  580  			int sb_len =3D SCSI_SENS=
E_BUFFERSIZE;
^1da177e4c3f41 Linus Torvalds  2005-04-16  581  			sb_len =3D (hp->mx_sb_le=
n > sb_len) ? sb_len : hp->mx_sb_len;
^1da177e4c3f41 Linus Torvalds  2005-04-16  582  			len =3D 8 + (int) srp->s=
ense_b[7];	/* Additional sense length field */
^1da177e4c3f41 Linus Torvalds  2005-04-16  583  			len =3D (len > sb_len) ?=
 sb_len : len;
^1da177e4c3f41 Linus Torvalds  2005-04-16  584  			if (copy_to_user(hp->sbp=
, srp->sense_b, len)) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  585  				err =3D -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  586  				goto err_out;
650e66d86e6238 Hannes Reinecke 2019-10-21  587  			} else
650e66d86e6238 Hannes Reinecke 2019-10-21  588  				hp->driver_status |=3D =
DRIVER_SENSE;
^1da177e4c3f41 Linus Torvalds  2005-04-16  589  			hp->sb_len_wr =3D len;
^1da177e4c3f41 Linus Torvalds  2005-04-16  590  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  591  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  592  	if (hp->masked_status || h=
p->host_status || hp->driver_status)
^1da177e4c3f41 Linus Torvalds  2005-04-16  593  		hp->info |=3D SG_INFO_CHE=
CK;
98aaaec4a150c3 Arnd Bergmann   2019-03-14  594  	err =3D put_sg_io_hdr(hp, =
buf);
^1da177e4c3f41 Linus Torvalds  2005-04-16  595  err_out:
3b524a683af899 Tony Battersby  2015-02-11  596  	err2 =3D sg_finish_rem_req=
(srp);
97d27b0dd015e9 Hannes Reinecke 2017-04-07  597  	sg_remove_request(sfp, srp=
);
3b524a683af899 Tony Battersby  2015-02-11  598  	return err ? : err2 ? : co=
unt;
^1da177e4c3f41 Linus Torvalds  2005-04-16  599  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  600  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9104277029946452305==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICBCqgGAAAy5jb25maWcAjFxLd9w2st7nV/RxNskiGT1sjXPu0QIkwW5MkwQNgP3QBkeR2x6d
2FJGj0n8728VQDYBsNieLBw1qvAuVH1VKPDHH35csNeXx6+3L/d3t1++fFt8Pjwcnm5fDh8Xn+6/
HP5vUchFI82CF8L8CszV/cPr3/+4v3x/tXj36/nFr2e/PN2dL9aHp4fDl0X++PDp/vMrVL9/fPjh
xx9y2ZRiafPcbrjSQjbW8J25fvP57u6X3xY/FYff728fFr/9egnNXFz87P96E1QT2i7z/PrbULQc
m7r+7ezy7OzIW7FmeSQdi6sCm8jKYmwCiga2i8t3ZxfH8oBwFgwhZ42tRLMeWwgKrTbMiDyirZi2
TNd2KY0kCaKBqnwkCfXBbqUKesg6URVG1NwallXcaqnMSDUrxRlMrCkl/AMsGqvCcv+4WLrN+7J4
Pry8/jlugGiEsbzZWKZgoqIW5vryAtiHscm6FdCN4dos7p8XD48v2MJxZWTOqmFp3ryhii3rwsm6
8VvNKhPwr9iG2zVXDa/s8ka0I3tIyYByQZOqm5rRlN3NXA05R3hLE260CWQlHu1xvcKhhuuVMuCA
T9F3N6dry9Pkt6fIOBFiLwtesq4yTiKCvRmKV1KbhtX8+s1PD48Ph5/fjO3qLWvJDvVeb0Sbk7RW
arGz9YeOd5xk2DKTr+yEPgimklrbmtdS7S0zhuWrcB86zSuRke2yDvQV0aLba6agT8cBYwchrobj
Aydx8fz6+/O355fD1/H4LHnDlcjdQW2VzIKzG5L0Sm5pCi9LnhuBXZelrf2BTfha3hSicdqAbqQW
SwXKBs4gSRbNv7CPkLxiqgCShr2zimvogK6ar8LTiCWFrJloqDK7ElzhAu5nRsmMgi2HRQX1YKSi
uXA0auNmY2tZJMqwlCrnRa/nYE1Gqm6Z0nx+jQqedctSOyE5PHxcPH5K9nS0FzJfa9lBR14GCxl0
4wQkZHHH5RtVecMqUTDDbcW0sfk+rwjpcKp8MwpbQnbt8Q1vjD5JtJmSrMiho9NsNWwTK/7VkXy1
1LZrcciJBvRnNW87N1ylnWFJDNNJHneEzP3Xw9MzdYrATq6tbDgck2BcjbSrG7RAtZPc4wGGwhYG
LAuRE8fY1xJFuNiuLJiTWK5QzvqRhiIxGWOgsBTndWugsYZSSAN5I6uuMUztwyH3xBPVcgm1hpWC
VfyHuX3+Y/ECw1ncwtCeX25fnhe3d3ePrw8v9w+fk7XDZWe5ayM6FCj4TsIoottana/gPLHNoF2O
Q850gRot56BmobYhdSnuMeIcTat4LeLyfpH/h+kFCASmJrSsnEYIm3MrpfJuoQmBglW1QBsnCz8s
34HcBAKmIw5XR08qwfSqapTCgNJwWDnNl3lWifA8Ia1kjewclJoU2oqz8jrAWJ6kjRdTciVddzLP
cDUIIXLbABNguZu1dSCwzkLBjhfqKB9r/0cgMeujYMo8LF5Bm/6wHEEeorkSbJsozfXFWViOm1az
XUA/vxglXjQG4DEredLG+WUkml2je4zrZNSpseGE6Lt/Hz6+fjk8LT4dbl9enw7PrrifLEGN9PeW
NcZmqNuh3a6pWWtNldmy6vQq0OVLJbs2mHHLltwfVB4YL8Ag+TI6OdW6r0vhFkfwUxrbKJlQNqaM
B6AE7c6aYisKsyJaVMaSbfY9taLQk0JVhHi5LyzhANyEM4Nd1NzoWJHJHJvsaaSw9s0VfCNyGtr1
HNBGqlmSsXNVTobpDHk4JkSlYP1BU9GdrXi+biUIHep8wB2U9u7VILgqrpOwebDNsAMFB00NsIVT
0FnxigWgBwUAZu+ggQp2xP1mNbTmEUKAslUxcSWgaOJGjKTY44GC0NFxdJk0lngFIyF2bDIp0Rr1
WmFcxdzKFkyJuOEIwtzWSFWzJifRecKt4Y/Iz5aqXYGjvGUqUKqIgkwAgrwWEMX5VcoDqjznrcOI
TuuleCXX7RrGCEYDBxlMrg3kKTUHSU81eD0ChDw4EHrJDUJ0O8FrXkgmxSVMMkIiHiUdcUekEtPf
tqlF6DhH+8GrEnaJlOX52TMAyGUXDbAzfJf8hPMdLFIro3mKZcOqMGji5hIWOKQZFugVqMgAQYtI
MoW0HUx3SUyEFRsBI+5XNVgvaC9jSolwb9bIsq/1tMRGW3IsdauBJxe9r0h/t+XQJzEolAjnEYdT
dFYFgzjjyKCJJndbFPSd14E3Be5K4Ks4tZaUQWO8KEKl7sUbRmBTp8AVwuDspnYeVqS18/OztxPs
1Efm2sPTp8enr7cPd4cF/+/hAYAYAzOaIxQDLDyCKrJbP2yy894Y/4/dDA1uat/HYGhD4yXrloHh
di7FqJ8rRjv6uuoyStVXMguEE2rDrimw7H2kI2p71ZUlIBBn+Y+OKw12lSxFRQuy01HOBEXORhyS
G5h376/sZRDngt+hCdFGdc6Zh/Hm4B8HRwDAZQv40ullc/3m8OXT5cUvGI8NA3NrsGRWd20bBQ4B
aeVrDyAntLruEkmvETGpBgyU8D7l9ftTdLa7Pr+iGYYt/U47EVvU3NHF18xGoGYgeL0Ztcr2g5mw
ZZFPq8DJF5lCz72IDfvxmCO+RdWxo2gMsASGgHli9o4cICcg2LZdgsyY5GwDqPLAx/t0gOQDNxYd
joHkdAM0pTC2sOrCKHTE50SXZPPjERlXjQ+3gHHSIqvSIetOYwRqjuzAtFs6VtlVByayyiLpBWm2
OlR8fatOzDDigHGz4JiXYCE5U9U+xxBQaDrapXcIKtAQYA+OLkUfQdcM1xwlGReW5z7G5HRd+/R4
d3h+fnxavHz70/uckePQN3QDvj2KEaU2whngrErOTKe4h58xqW5dMCqQLFkVpdBRiFJxA7ZVNDRE
xma8lAHeUZQhQo5MLP24onp8Z2C/UAZ6CDDbA2gkjBe3mobOyMLqsR0C0x+tuC7B4wyAw1Ayxeu9
SAgl6F49Fpe1AFUGcBnDTzhORXS72oOYA0gAiLnseOiEwwawjVCRNh/K/JBoLT6w6FY0LpY3s/Kr
DaqJKgNhs5tB1AYzDzYsGY4PG7YdxqVAVivTw6qx483q9ICSMA6F+wbWwVM+NlK/fX+ld2T7SKIJ
704QjKaD+kir65meruYaBO0CSLsW4jvk03RaygcqfSNSr2eGtP4nscD1+n20qrnqtKSPb83LEk5K
HLEaqVvRYGQ9n+m9J18WM21XbKbdJQdEsNydn6DaamZ78r0Su9lF3giWX1r6TssR/znTKgDgmVoA
peqZ09Vb4lirOiXQ4BS8ifVBo6uQpTqfp3ldh/A9l+0+bhqhawtGwwcLdFfHZBD3uABw/C5fLa/e
psVyk1gC8PnrrnaqvGS1qPbxoJwmAoe21oH+EAzUI5oXG7nDyL+pd3OGpw/WorfNK9BIURwHza1f
gWmx2/gIcg4U0P3TwtV+Gcfjj+3ASWMdjY4HHoCYja65YdDfScauzr/HcrNicicayiy03CtMFY6z
qAXB2ziYpC0MDIBSxpeAQi9oIt6SXb1NaYPbcJnWCkq8SdN1iLhdUR35aUMZBgDkzNFwd+uWtZPT
IYfCyNAqrsAt8FGYTMk1b3yEBy//Zm1+Hdt4j6AC/+3r48P9y+NTdA8ReIfDUWuc9/s1MGYTHsVa
CttMGXO8ZsDGCA4HUeS23+3euZoZbzzRii9ZvodTFZumaFnbCv/hLpAyXnxI0DAZhRPF+3W8MYrj
ggOojWLJtcjhvEb3m8ei40EddeWRBHOltemRQ2JmC6rKkpFQzW0wqJuvkeZCaBJuVSPxlgzQN3W8
POVthOr6wqu3FDTZ1LqtAM9dRlXGUowWktMaWC5ouDaSv9vCOQ2Z4FjLsgSv6/rs7/zM/5fMMz1S
ect8co82IqfwoQN7JWBmqAxKgxEulfMP5slOgQ/ZDXgLHqhtUaHUVgMqxmvmjl9Hg24NnwwaDRv4
C1JjTEp1bXqdFkksXsHj7cw20He1UZE6xd/ocgkDXi4FzrEp8NqTuYGp1eDIoXZg8YWFI4OmLeRk
yXXNqMsUZ7prMXGAvMoweufWDjf4Ox7QyDq3Jglfn9Q0hmNLyrasbuz52Vl0Sm7sxbszcjRAujyb
JUE7Z2QP1+ejwHr7sVJ4Jxy4I3zHI7uQK6ZXtuhqak3b1V4LNDEg4gpPxXl8KBR3UbBYav2uYbQf
o6qx/nPRCFcrBCtDL6wSywZ6uYhPnjRt1TlTH0VmQZGil1OHDNSy+KhkyDSJIm4KHe1gXhcuZgN9
VLSGlYUo97YqDBUdHu3OiUhDJOn+5A+HvB/rMV7x+NfhaQHW6/bz4evh4cW1w/JWLB7/xAzKKGrR
B2iozQyDJ/XRFR9LWLHBK5yCIOVVIEPbD97CWufXCIzPjuHSSHUNYR0cbECb/Bpsr5MkDbpGrrs0
RlSDLjN9YhZWacNonSuBnTCgRf3YHETQQQBzzPlCXjfFJamqfFttrmwi2I6g+MbKDVdKFDyMgsXN
83zIMZrrgKWjz5gBDb5PSztjYoTtijfQOwUKHbFk0wqFzNdz/M4fURx2Veuk+9GP6DHXHDnOsYmJ
SfnMeU4aZMulAqFIIuwhr1kBDmNVIiYue9aR3Ynq2qViRTq0lEbIBp0u6MaYC7w3oK6q/XJKcH1A
e8zNW8gUm3uJy2gM7utyGun5DjsN3jMoD7OSJ9gULzo83Zjut2UK7Vu1n819dDLa8uCgxuX9hWTc
BRLmB1C0hra9w7LB3+VM9hBAWkB1IBHzSAXU1ODmDYlTi/Lp8J/Xw8Pdt8Xz3e0X76NEviPK/Vxe
ElH72LD4+OUQZK5jXlIR64GhzC7lxlasKEhlE3HVvOlmmzCczvONmIZoIrmtnjREHkP/6Dij4CrW
YRxkpC3bd22SW6rs9XkoWPwEB2dxeLn79edwE/A0LSViUXrjHbmu/c8TLIVQnEwf8WTWBJoVi7DH
uMS3EJcNHceleZNdnMGKf+hEfP2IF09ZR+n8/koK3fKkwkzYG0EQSZLVTBI1oKcd0XPDzbt3Z+eB
MgIPuckmqHqvy4zc6pk99Pt7/3D79G3Bv75+uR2gSAytXChpbGvCH2sX0GN4fycB4g/HuLx/+vrX
7dNhUTzd/ze6g+ZF5KXCz1l0XwpVO50HCIt2H8qtzcs+dyNcm7B8wIVE9aWUy4of+wlb6EkY/3DR
Fmd8JiEVc/j8dLv4NEz2o5tsmMc2wzCQJ8sULex6E7lReDPQgbzcTBIpBxkBI7rZvTsP4oB4p7Zi
57YRadnFu6u0FJB557B/9Nzk9unu3/cvhzsEwL98PPwJQ0fVMaLYyCdJ0iXQcUnKBosaxdKGi1uA
pSGaWqc3i/8Clwf0chYHV/xDHehtr9HzLtO3LikjQn+ScTitrUk7dhsyQueucW4PZpzliH2mLrJ7
J2NEYzN8XBFMCW8NqcYFrBLelhNXypNl8KVzLc0Nv28GIIQtqaSrEjx6d40MQBnRIfXoANiipKbx
zYVrcQVOQEJEBYroSiw72RE58Bp21JlC/ySAQIYl+ALouPU5d1MGzYdQywzRWwlbs/Rhkh+5f3Pl
8zLsdiXAiIrJ3R/ekmtb7BuG2s7lxvsaCd/lRSYM6jSbbiO+DwMftH9Wle4OwCQ4v03h7797uepN
T8QXJRjFG4dPwGYrrrY2g4n6TMqEVosdyPJI1m44CRPevOCld6ca20jYkih9K01sIuQEQSzebLoc
UH+9n2SIjo0Q/Q85SqpfIox/UPsZKYkT1DB3rGer686C/wJOSu9uYEotScYsbYqllzt/TnyOdH/X
lAymL/XXATO0QnYz6Rqiza1/LzM83iOmqnmOBv0Eqc9kCS410ioTxlGZ9hR/Xzfxv6Zd4qZVIGHJ
eCb5HqOyjstDNR5Q8BhK8j69MtI99qAWYCvMCrSzlySXpTBRyN99elFLlMouze7zxXVaPGjJBmPH
aEQw1Qbj19T+Ig3bQFOt0gmAEhmi0DyHYxhEJYDUYTQGLRBmmKrJIdCyNDg1UBdy2y8AoTZd5SEo
SM0kShFLDeUOVCCpz+Nax2SxHoPHWiuvMJkHEzQAnYU58HhBosWyj5pdTggsMVtHVIuaGbeUMhMG
jJEZXliq7S4UxFlSWt0vP1mdIo2rCV5ydXkxxGZj84AqM0ypTNFGn7YK4ClX+3aSjzZinlSf9i+X
eptGieFconccKexTSEGUh9zRiM3d3oBpcpftHlvmcvPL77fPh4+LP3xy6Z9Pj5/uU18f2fpln7uk
wbk7Np+9yftU4TFD80RP0WLg63PEpaIhMzy/g4KHphTsM2Zgh8rEpSlrTKsd73j6YxoqtV4+3PtI
2HI2c0voubrmFMeAME61oFV+fN+dBsITzhkXvifj4VJcU/5zz4FCsQWIoTW+gT0+9rCiduITLgIc
lRomB9qrsGtM8p5tVfvnXmnUOeszp44/AaXlGuNoH+J8ruGJR6aXZGElsmk5xleWShjyqUhPsub8
bErGvMToUZB7Y9TfWDhDTgWakGmbmbQeFNn6wwy/P4ylTsfgS+mB4HLLltFigAz+swaDhqHe8bW3
Ty/3eBgW5tufcU4mTM8Ij0/7ywpqV3Uh9cg6jp6XIioeo1lJj+F06w8Y84mXAMrQhRYyLnY3LP6F
uBzfnQWOLdQT0l/MFWDQ+u87jMdgJK/3GaezZwaOrKQDl3HXx7AVK5gJ0oeZboKQUNf0u4KZjk4j
TAz5eJfjYzSqDh6xO0XlK3ssEOJAtdVgUWaIziDN0I7+r3v3X4xpmCPLPCWtrLZ01Un50RY0OCJQ
bBVrW9Q2rChQOVmncSi7PbzxsBkv8X/oX8Sv1gNed2lotwoaD+c8vrtzcsT/Pty9vtz+/uXgPrOy
cFksL4FEZaIpa4MQKxDzqozjJD2TzpUIbXpfDNo0/DKJxHuCPo+4F6m5Ubgh1oevj0/fFvUYCp7E
c06mMAy5ETVrOhbHYo6JEZ5GRe185bg16/ICfb3Q/Tg2l36NxXu++Op22UUVEG20xsmoS+Ia8x/8
VDK0R/H1XF/kgWI+E14biWNvLv1EcTxkkXtAfM8hA+gWiqDPCZYIe4PokA6WZfhwh8PM/t1/oa7f
nv12TEA87U1QVDDGW7ZPbC7BVvunW/TlBThxPveDJs98GOWmnbuYv8k6yiTc6P4tUhAvHsqcOFAh
3SGQiM8PhpjauCQu0OQmiOGqdbRncKRdYiK+hg/CVJjzGCEHFyzCazjwcFqXlldSmqg13PtnoXe/
xq0cPP7jUZ0/jUO9hh8/LdAcXv56fPoDACyVSQASuubUwoC1CBwP/AWqJYovu7JCMBrtmWom27BU
tVOaJBXGjWFZ6m7FT2m0kK1/r4lfwKBNaDvmOriMSAowAVPbhPvtfttilbdJZ1jsslHmOkMGxRRN
x3mJVpwiLhUGRepu5noHuzBd0ySR7D0qIbkWM0+hfcWNoS9skVrK7hRt7JbuALfFMvolg6MBdp8n
ihaV5Mxuj9MNC1HgkiKTt0Nx3HxXtPMC6jgU236HA6mwLxgz2tOCDr3Dn8tTYPXIk3dZaJMGjT3Q
r9/cvf5+f/cmbr0u3iU+1VHqNlexmG6uellHZ52+JXNM/q02pjPaYsYvxNlfndraq5N7e0VsbjyG
WrT0awhHTWQ2JGlhJrOGMnulqLV35KYA/OMgg9m3fFLbS9qJoaKmaav+E2wzJ8ExutWfp2u+vLLV
9nv9ObZVzeg7YL/NbXW6oboF2Zk72viVHgzI1kytT/K0q72LgIGVq9vkFVLI7MO9tD/YniCCeiny
mXEK/MLFjMJVBb0LZu7rYwAhyfLqYqaHTIliSd0C+2A9qgbNQknqi+ic5Io19v3ZxfkHklzwvJn5
tkZV5fSjCPD0Knrvdv/P2bV0N47j6v38iix7zpm+7WdiL3pBU5LNil4RZVuujU6qktuVM0mlTpKe
W/PvL0BSEkmBds8s6mEApCiKBEEQ+Dhb0lWxks6bLndF6PHXaXEsA8lHIo5jfKclnWqF/aF2sfQr
cypVO8rxJEkWiCVom3Eb+HxM+QPocIkyzg/yKGpOq6uDRECsAGgRtFPBNwbXgawMLH74hrmkH7mT
YQtHtzSK6ZdBiXSOyHCox0NSd1UdfkDOJaU9KzsfoUoUzJO9wGIvtVWjd824ryodg7cpnX2AQWfB
5/nZK5QMT5mUgtLQaiFG6CB5al3wic2dY+0gTsMnEspPWSvoNdSAlq7pe/Xx+P7huYpVq29rMP+D
nRhVBay9RS5GAADGDB9V7zFsk9saGCyrWBTqr8BU29CzkyXQcVVI4yUIP0F01lFUsFeX7sdMtjiV
nTxC3V8d4/vj48P71cfr1ZdHeE/0Ezygj+AKViklYDnADAW3Rri12SlkKJUaP7E0eHIryBg27Pu1
ZZPr34MvzvlI6/JMJCdngraBeFzu2hBcZJ4E8CslLIF+pJxtZyc0j1qlO3WHOfq4Mbb2j5iTGDvg
JwkTaaEVoqHE9a6GzXGnuvzTNDNPumkQPf7r6SsRWqWFhbQ8huNfsHRtcH5njipQHIySowrouCMw
RO3AFMXKiWNTx+/q/zBAk24Qn3KfOG4QJDL3tNmQTFQK/UFBpI15RYEKquLSiaY3FAo1pOepsHQJ
rxV84CCG3ta/JHwWeEm9RJnFfnPaqAy9V1vWmSfeZuSCgRwV/yh9+dDxPfIqfazX5Tu4cMAqsLre
b1wKAvCMiI5fRQ02ztwPojzLqMoG/CqLKezcXPWUyhtdJYMVyavRjQNR/YUnzTCHVV7RqJ83Q0Zo
eJShEMZ2nJcIfGlKMK5m+BdtepiIOQzjHB27AO3r6/ePt9dnRMt76HWC83WTGv6ekvlHyEZk4BFA
Ys8YUrndhjcIltOMWhQ9vj/98f2IUY3YOP4K/5F//vjx+vZhR0aeE9Mu6tcv8C5Pz8h+DFZzRkp3
wv3DIyaQKvbQUQgQ2tVlvxNnUex4aW2q6o5RN3RMhNhQEoFO/nQzm7oVa9JQaxfXfbHJ/QkY/fH7
gRF/f/jx+vT9wx8OcR6pKC/SCnIK9lW9/9/Tx9dv9FCzNcHRGMN17EBIna+i97A3qXKHWxsFJNE5
rCXnrHIme8YFs/KL1W91kt5y4RpHUNCL+DYv+uvX+7eHqy9vTw9/PFqvdsLE+KFq9bMtZnadmgbz
pKAgHjW3ttSVoegsZOstouub2Xp4lFjNJuuZ/VbYeDzm6s9DBguMlcIzRIdI3qevxmC4KvyTnr2O
LdnFqXOq5ZAxD3TngIof6qx0o647GhjZ+5yaBtDkPGKpE5FVVvoxfbC3wpf/3Y8jf36FWfE2tDk5
qi/rnMJ1JOXgjxCW1DJXmrpiQ6T38CJDKRVZ2HdC/1akANhwGjqGVNhDESo4Yhz9bV6ut+eZSs47
2Md63R5AhVLQPI9qfRY8+o8qcSBd5oYdH6pYjovh0YcpC3YARrZR7lAUYuoo1YhqJPV+1Pa4XIiI
BeZDAGgd2Yd9ikBUG1hcamEbl1W8dY5y9O9WzPiIBlaWGBGP06E9hpRldjBAV6GNP95VCAM6wm3W
qArJ+WYgYqyzCthToy+xRyeyErVQdKHXbozReH72uTgPyt53E0YFbl0we4rOXMl2wmhSl+BniXZk
lW9j1vmXvzlZJN3TLfVZwPaH00l+21w6+ht/txmiBUPdgQATJSNFlVwU2m+aczIZfS1CbY2QwjH4
igRPvepQGkCiTqZrJ74XiLfF5pNDGAXQAc0EHjg0Z2jBb30ENvw2njKHpoMZ/MB2K69WBwK7gH8h
Agg79ouhjrt0VAxUZ1JQ9eldj6B5/Zo8eiRrVqubNYXZ0UlMZ6vFuNK8MC/R0e3TPnXUp9QWbEsl
LALy9wE97uP16+uzba7kpZvTbEK1HAeVid7K92mKP4jmdiI2mCiPKhcBAVovIkpzdqXRkpQyghEs
yvmsaahG7Gk7qGOnRVEO892mqtgBDU+/8vkqnqswZUePjKoN7e3tO2ZDzbiOK5sV9SIVo133qtvQ
i8ejQyAlFs0uXF9iEkhbu5TwOeRjz7a1kqrXtZ/xkMXWZsNIIrU1gDh+NwDLwV5BUX3IxMiWKoHd
0dlwKVrCNqCD5aiygA9L8bxzIYfFqq2tZCyiN2BsTuJoCZszOoLqPKR2j+nt29P7V2rlYtFytmxa
2IBQKhdsl+yk9KTVAWKTYe4MpSt2YCrBVOvfohZJ1vqgRYp40wRA1aC31/OZXExoNizZaSERrQsh
VUQQo1wul/NlmyVb8pKIHdgVaTG0k5WRXK8mM5Zaa7SQ6Ww9mcx9ysyKJ5VxLgu8mwM4y+VkEO0Y
m9305oYooJ64njRDiV3Gr+dLa28Ryen1yvp9MAa5iZeytThGrO9ocN6KjZxR3X4zdAmV9iS0Mkpi
O5UBj3irWjbOkw8lywXlCdsJKeCv2/gEhrrleeIzdynUv2GkQUNZ1c6my0k37+MYDNNs7BrQdNA+
s4Xls9VEDYJhbTQ0OWPN9epmafeE4aznvKHWPcMWUd2u1rsyls3oWXE8nUwWtunotbh/x83NdOLl
XWqaZ/9ZRJhiEnYOXe6ByW/9ef9+Jb6/f7z9+aIQn9+/wYbl4erj7f77Oz7y6vnp++PVA0z2px/4
X3uq1+gZJNXFf1GvZfuaEZ0KOUfzn14p8IRaoTyR8GQ6UT6L3bzujgh/zpVp68aO49Oz5JDZru6Y
7wpvJLOUY7obSL2MRniIjAPZGvw7tmE5axl9KYujcftZoTKZXLwMzxTR13HgCaMuPB7/KoI+K5yw
8YqJCK/tqqjtBxawVBAWd6CdFUXdRJH0Y021wDxaI+/8Ap//n/+4+rj/8fiPKx79CiPdQSHozQxq
Xee7SjOJmH8bqrGX2xI0vvPazJXfxUnBUfS02G71gcowTJEu8TJBtTOme7zuxvu719sSgTmwd0dV
Jnzc7a6EUH+f+zatxFxxVf2L32KGM2sD/wTLVqVVtruwxXsbr9a0OCrI53Cjox05qKlx6diD9EaQ
DNrSJoxrwdUcVK5OGnFomEskCpdWqmHdk9B+UujBxsiyLRb1SppOtCTZuxmb+jd+8zGNWQaCoanT
1238O+yQLJ+T5vGa7mPDNuN0NBgx9ONqOl8vrn5Jnt4ej/Dn75YeGKoRVYx+EOqlDAu2aPJkr1Fn
6+51HuOgXwtENVMeJDc1ivE2zvZZsZfxpqZis2EnrZGtrYmZdx/bwR9TF/HRESxoe5IcfK3tnlX0
piS+U6gMZyJgQ8Y7GtRxYDME73wIoQSLMsg6NCEOuncCR5MbWMD2ER02tQ2EU0H7ZBx8L9STReBs
vd7TDQR6e1AfTd0MGSh9OLv1y915mKdZCMB5J9pQjBSr/OgtfbD1BObK05c/8fpcqc8ymJUV6Jy9
dYdcf7FIbzZgarnjFcL+OID9DKbDnLtOhTidB04V1cHHnC9v6ECuQWC1pvsYDOSYBpmuT+WuINMj
rJayiJW1i1hoSAqTMKEViF3BNnbnbVxP59NQJHVXKGW8EvAQB6RfpoIXZHaiU7SOfcC22Ntm+KZl
LS+9RMY+O/t7m+XYUvBzNZ1Ofa+G9cGgbABL2XzMPOOhiY/QQc12c6m1oMXyWjgRkOwukApjl6s4
/Yo4lAtHjbM6DYU+pvTmGxm0GkBO6PNcGCf6ok13Lm0W9FTZ8Az1Jq0nNnkTwLcODZ1abIucnrVY
GT3lNEIiblpDBUMRdMMLcw8yb5NTyMdWmeEg3Nb41IbfKXQQNvK6zdrFqXTDvQyprelv37Pp/urZ
9Icb2IfkQqNFVe3d42G5Wv+kYiWcUpK7+LG0V8IuopLEnAm2jRFevlf79Js0GCdD86KctC+th0au
GtZpGKkgHYZWKROFNjwondFHnXKfR4FIJqs+MN7S2HVqx7OLbY8/m8uLh05WlDYv8RKhHFaJDI+O
/Qk6rinZfxK1dGD6jN5MssOn6eqCxtBgYOS43u3Z0cZbtFhiNVs2Dc3y4cFjOjgHyRNfbhLIR9jS
4Y9APwQyR5pQEX+5GDiL4NNpjfeJdKVYXZGxCvaFLlb6IQvF08rbLf18eXui7lm0HwRPYXnhjMIs
bRZtIGQYeMvRBX02Vx7PspPjhfYIXrmD4FauVovApfPAWk6hWnp3dys/Q9HGjxCjH1r4swq65WYx
vzAHVEkZZ/RYz06V40rD39NJ4FslMUvzC4/LWW0eNuguTaK3HHI1X80u6Gz4L55UOnaenAVG2qEh
k0Xc6qoiLzJaMeRu2wWYYPF/prRW8/WE0FisCa0UeTy79YeAX7r0tzZEyw8icu1AfWc7vfGyCha3
wm3vrg3pEUS9vbBc6kxW6KetyN3IlB1Y1jCGyYpPMUbIJOSlInblcS4R3Ij8dHdpsXUjq+5SNm8a
2jy7S4PmHtTZxHkbYt+RuYV2Q/boNM4cS/WOsxtYA9o9C9iDdxxPCkK5ZlV28ftXkRtVdj1ZXJhY
GCBcx47BwAJug9V0vg6khyGrLujZWK2m1+tLjYBhwiT5RStMF6pIlmQZ2DCu5xaXv8ARs10ytoH4
bEaRwiYX/jjmswx4gYCO0WT80kZLitSFCJd8PZvMp5dKuR5kIdcBiFpgTdcXPrTMJCdUksz4egqt
oad6Kfg09Eyobz2dBvY9yFxcUuqy4KDS44b2mcharVtOF9SZ8ide/Lz73FU6ZXnK4kDkEQ6hOBDV
gGlSeWDZEtRl8HYjTnlRShevITrytkm33gwfl63j3b52NLKmXCjllkCgeTB0MG1UBtz3ted4GNd5
cJcT+NlWu9C9icg9IAyaqCncAKvao/icuyACmtIel6EB1wvMSXvbqlyfSduVm1NqVK2pCCQFGxnW
iLAKNjJpCt/j4kdsROW5KsycQ8aspE+BkiiixxsYfmUYOkBu/DtKhofuTqH0KrTViWslTUC17A5v
CO8owbWemAbQFcqSpkt6V7uXG5P9NzpWQBbsrOmvhMxb2NsFXHLILuMtk3v6EyC/qtPVNHBXzMCn
tSby0S5fBawO5MOfkCmIbFHuaCV31AuJ9Wtw3GZ6Had49c5d4Hfn7lyod8uRLUpWmtnZOTbLctMR
3M7/QrC8S/J8VgULqaPYCwwSoIdaJWTmZkMTlQ47WIoZgy0d7FN7O0awK+ZmAzq83uaimPbxu82w
T8Nteh2Q/3yKbJPKZil/cZy7Di2jnCp24vS8OIbOrTLc1tCuPuO9aQOhVzDWF8GzHH0wKAUVPaaO
5oZczMGXISNyQTvYrs1D1pYYaPjiU/oQG32w+v3Hnx/BwAqRl3vri6ifbRpHzrG8piYJ5sGko1wC
R0ijZd1mgfGshTJWV6LxhVRr9++Pb894KcQTXun+v/de7J4pj8ewoTR2LfKpOJ0XiA+X+J5msToz
lP6qS97Gp02hE4MG94ihgX4rl8sZrZFdodXqrwhRW5JBpL7d0M24q6eTwLrgyNxclJlNry/IRAYL
obpe0SgSvWR6exuI9u1FtmXAW+JIqKT/AExEL1hzdr2Y0oAxttBqMb3wKfR4vvBu2Wo+o7WLIzO/
IJOx5ma+pE9NB6GA7hsEymo6o089epk8PtaBs+teBmEy0AV54XFmi3vhw5kLzg16+4Ua6+LIjoyO
lhik9vnFEQW7sZI2pXsRcSevA0djQ0+ANqMPgqyxNIcJe6GeOpu1dbHnOw+0jJA8povJ/MLka+qL
HcBZCRvgC83acHpvOYyo+lZdt0ToI0tpWxGJhbowWc4IUstS557Tnr45RRQZvWXwb1lSTNjAshJv
2TzLhL2+k/8/iPBT6abRDCyF4NddZjBsR3o+XrKN0QD0rmVoRIz2YsBFZz1NjQoSrGQQShDZz49A
GNiHTP3/bBVdT3jFz2U9KQFWlmmsGnlGCMbRch2ICtES/MTKQExdoTHlwQIMBd1qkYNsmoadqyS4
jJh37YfF+QcNcmACnrdGEBmNPsDUIgoHLIA7qAWwZyWv4sBpkZllsCsJuF3FYnRapGya3f3bg0oC
Fb8VV34kqJtYRWR+eRLqZytWk8XMJ8Lf/p2KmsHr1YzfTAMOOiUCVmVIjxkBjhqAGNeanYqNVjVe
sYodz1Rq4my8iv0ny1kWQmow1VT8Qh2s3JwX0EZNQGSvZIh337Is9ru8o7W5BPPxTKE2tZLfemKc
7aeT2ylZY5Kt/BQW42ehhlgfnEntT7TN/+3+7f7rB6bp91k85pl1fXL8eSG80fWqLeuTfZOBvjE0
RDRJarNlD3CbKpw/TBnGhOo+VPzx7en+eYxAoJWkxn7lduiVYaxmywlJhD0bLDMcNuqRglJ0rl+w
5XS6oTM8Otb0ermcsPbAgBQyoGz5BJ0RVEahLcR1HGWg0U5Ivd1KOxXBZsQNq0LtDxittkgW52Dc
klk/llReqcMpC3jZ5lZ4k0oW9yLkg+KmjvMosIWwBZks8XLig38aRvXWUUP6k/VEYUXUN7yerchA
EVsodW5jdfpORMTDi0ThhiBKzGhlyF+//4pFgaKGu0qMIGKyTVXYBb5f2pVw84EsojXM/Fo/Sdry
NGwpEhEIKjYSaIQJGiWxq4PzvAn4dDuJ6bWQNwEr2QjBqNrEVcQCccNGCiyg6/n5isy686lm2+Ah
qyt6SQxPwi/JmFOBUl6UZFXgIFGzqzK8lAE7kfBNykvPUFIiT9K4uSTK8fRNIVaIreCgp+k4eCON
KuTzdE67IrrPXQYi7bshBaN83KouYcRdG7zRnvG6StV6Tox1DaqSR6FA/36LXNf05jBvt4Hpkhef
i1DoCuaWh2pUWBEwy/IzC4W6sMRFzYHq0Hmd11QxxXAxTtKyUwGUfOllxZtYe6LEYA7DZhSM1DxK
gzix2cacGmmvfMLIIMLd0dxC5bjsO6K+O1gUdGb8IKaPBF6oGlhGf+xBYsMWc9pZM8hs4yKie2KQ
OQh6T2RLYMdeEOIwhAPOnEGowcOfiorxxX2i8I4UZZGfSgpbDJ35V18JQ3Aoesq58jByKsQesYoQ
53WBYYw2qlNPJ0NLYJ81Wzhpv6LsQC7JSR9sqbVlPDISu6bkq5v59c9OJ3STEqxOlwJj1bmzAn7f
OoT8gJnPVpsVFnkYdefg7w12ZWAHCvNoy3cxZprhcCdqqzn8scENrRlik5WckKMcOEUdEXD73fLK
tpltTnd2N2gdiwlrh8hjMqbFFsv3h6JWueUWEzrfJegnvbhPop7gCPCKslSRc6gRhrEqmtP4nWU9
n38u7URvn6Mgh+zGxCnHBELiYbCopyfHs9VREIjGSp8cb7b+1o8i/RmrPWL0lfuhKoeDVxn0gFj6
sGTGiQMnGy1J3eCOX6G7o906iQKq8ixCLxcuWV+m59HwZs/44BKzPU5hDQbx5/PH04/nx5/wgtgu
/u3pB2XKqmFVbfSGGypN0zgnwzBN/XqOvrgVaDp98ULHT2u+mE+uqaIlZ+vlIoAV4cj8PC8jcjQ2
zjQCOt1vgLow4i8UzdKGl2lkD6Gzfew+xWCY4bY68IzOC9mPJPb8x+vb08e3l3dnMIEFjPfAe8MB
iSVPKKI+Le6cD27F/cN6hwXiTw3DxCxKV9A4oH97ff84i0eoHyqmy/nS72ZFvqbPenp+Mw90DpgM
N8trC6Wjp7VysbIRNAwHk7tsRWnIbVZSPjOlPleTqVuNkK5XWdMyateLrFKIZuG/dq4CeUPP1HG/
MHX2/nOkkMvlehkaK0Jezyfux8Y4w+vGfQMdBeYSQAl3OgK1EYVfqqrj2dg8UQru3+8fjy9XXxCn
TBe9+uUFBsbzv68eX748Pjw8Plz9ZqR+hf30V5gUf3eHCEdtbPSIMxOl2OYK2sFPIvbYMqUtC0+s
2+efqWnDTmDwi9DEtyuz8SKQF29nk9ojZfFh5vY4pS6VrtXXlmhsZRLXDSVv40zrHItWqPNH9ykw
y4NvWzaUUYqc6nbe+IMo87JIkRqAnY1/wur5HXZ+IPOb1hD3D/c/PkKaIRIFHmXs3bVccdI8NEU6
XDWnC6piU9TJ/vPntpAi8WurWSFbsB0DNdYi7/Bq1GsUH9+0/jbvYI1sGyHi52wygfV742tTUnM6
fYqozE7z1fAdzfhUYYlrdJnAtFciiOiDEHrjhQwhZYL5MYMILgsXRDZ+jJ31wqN3nDvfk+MFFEAz
ty+QD4qOAYmutw/cErBhWtB8AsZOTcZhS1RSUW8uJuXOBpKAH46xpc+FpI3t+94tf4r8/ISYORbw
OyKTgAnmACWVBL5tXULh16//pGwvYLbT5WrVjoxZPb/UFQFXJhAUY4SCV8p8vEKxxysYyTAFH9QV
nTAv1YPf/yf8SHST0bu7UbP7zZs2lKyTEoMkahituq7CRh0XOZqllDyaVck+5573H2uC/9GPcBjm
FmS/SV1TmJzfzGwk347elLPJmqBn0ZgYsfXkmqgk4+VsLicr18D3uWMO3sj7/4xdSZPbOLL+K3Wb
9yKmYwhwAw9zoEhKoouUWCS12BdFja3uqYha/Mrlme5//5AAFywJyodWu/JL7AszgcxEVdj5dWcS
emeEv6/XCBnMYuKIenZG7T3zNPFrBPZZUaEh4KY8R9vIS2ee140s2PfSYuKac9t+PpYFfsQ/slWf
d2ckKLY5KFUO4TjvHfHcx3px1dJlvDNVK93t9rubWWVFnkIQefzyepoWxe5YtLeKLKr7LVwS3Cqz
qOuy71aHFj9lmtaWcF6+mVvJB/oWzye4x7ndr8CwLosKP7GbuIpTebv23WHXll1xe8j7cmNXTexi
7fX1+uPxx933p9evH+/PmIm7i8VeQHxepfbCyrogrkjoAHwXkHgugGLrqHg4cKFq1ZYH7GMPq097
DXsgiMdXIb7l8EhPSOjIsV8bp2dCyNTDrY65lO2D6ZAqd1KnlYjIrPvcrbEjR3l0YJxYT8TLEfOX
EvD8zIFKFQZ/3hQZdHip8+Xx+3euWYgaWtKZSBcH57OML/2i94G4MbLqxjd7NG6krPgQi0HPKT+l
jRYdTlDhhteVz7qH/3nq8+Rqy1WZXYNbXTsSxG11yq1WlA7jIwEKp8ojfnUlu3rFoi7GTm0kXOy+
EBob9ejSOg1zyqfyfnUwMXE5adWyK/fOQuCJZ91BWJCPZxZi6q8AJ08hY0Ava66xqwc07rkjpTMu
2fw2oGCpsTC71jFh7Gw0t+xZbDc2wzxARsgnxKz4qdxBkCwro1NHoixguIC2VPNJVxfU65/fuexo
t2gwurbmc5rvMK8eOTFPl6bK0QVrTnFBpWerVQMdNiFXKeKsz7eTDvSbSWPPalSTrVnonul9U2aU
Ec9U7owOlBvSOv+FjqVmf6zy2AspM2YQpxJG7UFY5bwZpD4dnTuUiH5rblBcVlXDy87E0OpMh84t
sOHYQW9A1fhJ4FujrH9FpyHWZVOFHNqD47ZIloNjmxHrY9fxTFlklCbIlJgdLsgJMTupf6jPLLJq
tmRyPDI4nLUFfMhWJPDMjjjVzCfmXsKJSRJou5c90abHYZYn4HT+qU2pnp3NQmsuLO63yGpZ+KqI
d6HAA5FgMXVHlkLyqLc6AmrzzKfWFtjt8/RYVpX2SAPSTuky063s9k+pEFTAx6f3j59cKV7Y49PN
pi02ab9v7V2La8sHPBA3mvGYr3gCQ5RPfvvv03BKVD/++DCOXE9kfK0SfCvQr+XMknc0SLRlpGMM
W9gqCzkpAbxnwDyrnJFugwfARRqlNrZ7fvyPasXIMxzOsLiGqFdB0ju437XJ0CgvdAHMCYiH4yFg
qDqeGg/Bbhz0XCKjS2aI3kpsKOJaYseuovPgd2I6z80W+MxVidDDzbJUnphhu5vOQfARYIUXuBAS
q1udPl8UdUm88tcWHRpBY3oDsKk061iVvuAxq7GJlwGwMvJUMioNEdv3BebVobHIklkLAdD1korW
Ak4RN3A1yKUGL8IHfJX2fBV+5upcz5IgxM7zR5bsRD2iLJWRDuMUaXuGiqBjrDEQZ1Lc9m1k6VaO
6P1Dsw18QGXUHoHaTVk90PhsPNihQ6YXg4Nrmz8gHcXFJfVuTaWHFCuUIy6f85GFiz4kxuUEg4Xa
NRIIJZp1zth9ZddAqsUu5ukZbxNmLDRwVA2LaYzlb54IWFmLcZp7a8qx96NQ2RZmehaQiGpGLEo9
SRDG8UJ5edGL6zLJG4WRXTImZepY4gpvqHRXgnkKjBx8/gQkPGNtEBAa00XloGFsdw0AsXq+pAAh
FIel4IKxh6dIGNoFAEVnTL6YVmS98oMYa9wgUmMDNM7VTXrYFDDKNAmIPZVHe04bafvQ832sxm3P
tzzcenVkOWQd8TxM6pmaPWlfdo/kSZKgIQeM12LEn5ejblUuicPd27a0Hbx3jx9cJMSu2ad3QvI4
IPgS1liwKTkz1MSjisivA8oHQQciV4rEAfiaWYUKEX3lYjwJxY0PJ44+PhPsJRUOBG6AYK3jQEQd
KdDXWgSgyWsTtO3JYr07Xz9ymIGM68HY+efEcS4v6xTeitpxsb/CMrlnEIt2IY974gEHNi7rtCbh
1pY+zFrUOUTHazef0cEFP8eudpnAj01dOUNOTSzgObJUjf7coNMr4z9p2V6ypnUEqTQYm+6wyJd3
ERrlasb5RwpZTXlRVXyDrBFEiAd8FmXYGMozmIUCy/Cej8LKzhfOHb1wbc9wcSBJ1xssSejHYWcD
Gz2U2MTfZVuHSfbE0nM18NCnfYG+UTHmX4WEdTVWBoeohz4oNXFw8TRF6hyrl68TVVrQ7LC+3pbb
iDi0q7m7QzQalTKPCrGmrJLFka9F/ZQFyF7Dl11LKPaWVFXuCi44IYD4coZYF0oodsi2GpcexVKH
XK4qEw8XbZZ2LOCg6v2YBlDqKDmgwdL8FxwR8riWBJAdHiRAGtvVAHrkRehGLjCChRDROCKGF5fE
jkx9EvtL0wmepoL9BE8dRf6NKkURNr0EgD1IJoAEmaayqgn6raqzxvccITImnurcFhtYeAv17bMo
DOzacuGR+ixCNtW62K0pWdXZIHBhlWtjvn/gcvs0U+oI03FmOPaxrDnd5Ro1MSwLNpwBj5cyM6D6
tQL7yHKqGbbIaoZOwqpGlQ4FxhdmnSz3WRJSP0BWJQAB+q2W0NJal/4f6CQEKKCYgjFy7PpMnh6W
nTynNfGs5+sXHWmA4huDzXli5i3vkcCTeJjCMHE0WR2rgcjn9q1ZmGgbQVNbxnZmolN9Y8l1q157
/Wskc7kV3Qc5sCiVctz/ExtcDmSLCaXZsj1h8rrgeySyXRd1RgIPmf8coMRDB5JDERxzLfYaxDIN
4nqxtgMLvjYkuvKT5dXPhacwor/A42PXJRNH33dxiGyOXNjkmzymrmSEspwR5FuV5l3MKAbwjmOY
XFvuUs0iTqVj85jTfUqRr3Kfxdjev60z7EPV1w1XNR1030FnSP51E3jo5xWQxanOGUKCFAUxUbPm
MChWNhixKEVS9YQStCLHnlE0cvDIcGJ+HPsbO08AGMmxTAFKyLLoLnjoktolONCFJpClrZwzVDEL
+w5bQBKMdM9Jm4cvni2i30ik2K7t7p/uTxe9GKZJDz5X7vP3Wfm89wiq5ovPTar73UkSxDOsDE9h
i6fjalMJ0XAw1WlkKmqufRc7CMoBNd2v16Brpp8vdfdPz2Q2zqVG8n5t005tKQLtXPq2VK1yRzwv
pB/CZg/vNhbN5VR2BdZSlXENKna3TR2W5lgSCNkCsRKz5STu3BHGxfoCwyrdbcTPjYzmymmnns1h
5FqsM7y0kpqvNllcYJiGMozGEotlSSNkjGWI0vhxfQbr7/eXx2fUo0c8pCqmVlal6GnSmUVTZY/i
kH2eLYA193CVVTfTcngxs+/22SXvO2ctxULlrH7gnW9UFljwDhkuDBfzstqdbRczw7tvbPwp7bNt
vlcOWkaK5aY0Abv9Kf28P2CXlhOP9NUXbqSXYgeLNEeKgICDwtaf5zbvBBMsbDJHU8nT48fXf397
++Oueb9+PL1c335+3G3eeGNe3wxrgzF50xZD3rAQrBGbMrQCgM7b537dT/lhFwPy4H3uxRd9VocU
Ta3zhEsliLXhqwXoi8YGpL2NNawaWYb+Kndln6VqpOFZWbXzBXtJL0rQtp7ylPdTjs4IeXGMpRpC
lCz20JeybOFafaGLBN41aBFcp3fUazCCxXr2pHbfvNdJa6mlmsDRhH/GGzvthEstKfoDUqE0ezjA
Q6i8IfNQpflRhiMcyFNBaVXW4KPqaDfAMfGImaxYZZfMZ4EjmTipZYWZqmsgND4XjB0n1zzTddk3
2Y11UBza/dgWlKFcxbwYvGrlqk67Vt+p1vyb58wr8j2v6Fau7IroLCaN9g3gLXTx9ywmdG2nYLEj
xbZBBnnbcObLri7hibV9bjz+LG0WnU3quLrk7B9x7EB8c+h2R3PYBiDypvbPw8jlVc8a/FUW08Aq
VpUxrFk4J+YK6Ggy7Kg4sPjxKpYdqXauNGh0JAPlxuAfBXHXHsV8FsfWEHJyMpAdwk22/eKqO5/5
RXPmSwrdDea3312Z78rE862eUeAs9ghz141/WFNKTHw0sfztX48/rt/mT2D2+P5NMWWD+IuZPUd5
ZjIU3Gip6MpmqgbnmTPCugmePdh3XbnSgtJ1ik8psHTgN6rhUEWItI+nHlGTCFFdzFTzjNRYHJWV
AVggfxHoDC9dZ0Ix3Z1lldUpkheQFWMCYJK1z0oH94RjZC7CGuS5ogbQrau02+Lc8FLMJat3DtRu
mBbAXoSV+P3n61dw47Qf8xin7zo3wssJijQL12ij1Zg6koLe+THBjiRGUPOdrMvMtmwXnGlPWewh
lRFBZC4Q0Ux7VGKGtlWWZzog4uV6qqGyoI7m8EYu4MhpsEraEDFGoZuW6jNN9+CUvWj4gE1EPzR7
UZAZdkgyoYmH5JQoNzqic4Xh2RkhhlRPPojNVq0nQ3+Dpl6gTjTfohH1hE7Qqp2RcpP2BTggW1fJ
ojMz4rtt7wRHQyOa6FluyyjgmzA0VrG06cHxvyszpZZA41lLvwStYPmleDik7f0UXgGpQdVk4C41
lwIEM8THpMiaob0dLJds259+lTGH4AOOvpHcIpjlC9Y8QMRR1s30Q6QKJI8GjV0icBHw3Uz1Kd19
4dvYPkf7EzhMRxGgMdbUzPMwYmiWIMiRh5mjyfUpLQLNVTu4lyBU3e5vpjPs8H2GE9/cLDiVqd4u
A5UlXoyUwBKK3ytNeIJdas0oM0rqIz8yliPQ1EtdQRu1UXNNHMumaEWEA0exoEiZiZpsHfKdAbsR
HBxZjDBmIiPToUMQLWs+Qc3CPmRY9gK9Zx6zkuzCPkIt3wDtisw6gxH0Moij88JbscBTh57r49fd
f2Z84in7bro6h575jUtXPnER932jd4lwcho/8fyPp6/vb9fn69eP97fXp68/7qQTVDm+AmM/tiIY
hl1/jr356xlplRmdLhVaX17S2vfD86XvstT8Lk/eX1onguEwc40Oz7CqD+aINmnFlVH8rLTpIuKF
uE+CdPNyBE2XIOrfJ2oyuogZ1Zd09OZ8gimJsWQscDwVM7ac94yPt0ThCCOX4KC4r9lVZtFCztLB
bbFNmv+bSrXFJo7wzdxX7gzHUx5b3huR9JCrEu7gI4ckOFWExj66hKvaDx1Pw8j+w0IPqwzSadCo
oOXlJ/ZK09VYr8g+2+7STYrfHgmJsy2/7HfpguBzqllgfhGHSyyENq1xAwm95SKk+6C6ee63tfQw
PZv784DoHql6GmrNva4HSca5aeqBSsYzx+GLoQfNc2k38zHfBi5VdEe8iWj79Fgc6/IMQcr3VQ9m
di9YJhD69SCjKXcHPMjnzAxXROKGaGLHM+UCzcZYnRjPICAhGYCyxiJ8OupcDkcghSkPfVWwUBCp
sqHQMJmrfE/wJo4cfCqA79RyFQwtUkEM1W1GFA0QKX2YtIulItPXAB3hyFUut/+1Mg8NlU1HhCc2
NntdxsA6S4T2m6m8aQihjjHjGEU/CQYLwSflOt2FfnijzoKJMQ+rm37kMdOl9ocXKrFjiFpWzmxl
VyW+F2K5cyiiMUmxGvHvS+Sj8w8knZhg+QkEHRXhQOXIjX/lQ3xUKvmRWmwe8ERxhFVn0o7QzAEN
Gf7am8YldKlfYguXRwI0mShI8NEUoOPlPJ2La1g3i0l0TzwDjDEVw+ARG6OzpQ4XMYONUUyrVJiy
hvBOo+jgNWFA8GFtGAsTx6ByzCH7qUwPcXJ7SLk6iZ7+GSzoygKEorsQICFzIbrVp4457OxmJojt
EdyYg82anT1HIc368KUgqN2/wnTkW1iEbmICYo7vtgCTW53enDAXiBl/yPb1GLcQSS5geGj4aNiM
Wpxt2jUriMLWlOpDWpe0h/CXeO5CAV/OlQuHWM+0faBFz1WR4SAAQeojRfu5o3WTeo6vAoDdjXnb
hTWLoxibuJNmj5VbbeCq1jHAHU/oRcsSF+dhRhh9A4wxM96Zh2tbIeFLC6se6GjUuYKkKotGJDCZ
4jPewlFLvp0Fcddw0JddGLozKDopXi2hgS5XS6qeeMOOjtDeM8ekjCGppfJ2K/kYuwVfs1W6Klf4
g3ltZp1TDUg2nm6pahg8bi0QkL336BNMkmfAVesUhcwVpKpXHbdHdJW3RxGmvCuqIuunO6nrt6fH
UVv7+Ou7GtVjqFNaw13KWOxfZp3TXVrtN5f+iNXc4IV3bXp4YOhXmNsUAs3c7I68dddtDMN2MxcR
y0HNZgo0ZnXPmPBY5sUeHp8wR4L/AS6f1fx+wPHp2/UtqJ5ef/559/Yd9GOll2U+x6BSlt5M02+D
FDqMaMFHtNE+KZIhzY8L4TEkj1Sk63InPiq7DeoAKFn7w04NkyGKr4ua8v/09gtEXJ/Cy9uXjP+r
M9HTbp8XRktXhzVEzkOoxzqtqn2mnjNgnalMZSWMvdXV5vjw1fxwgJGXvSgtBJ6vjz+u0BFiyP/9
+CGi715FzN5vdiHt9f9+Xn983KXyBqc4N0Vb1sWOT3M1epGzcuoqnE6GBXE43737/en54/rOy378
wccGDoTh3x93f1sL4O5FTfw3s7UgVcwTW1r/Xf/19fHFfotQCCBixI2RMwD14fF5bgLTpoNnCbR0
dRipngCiOv3Ri/RzAJG4YhG2HU8ZX1bF7sFKJZAMXs5CZ7vC05Qp9rGZOfI+64zrjRks+n2NrZGZ
Ax5Racqz3lgJfSrA4O8TClXU88JVlmPgPc8y61FkvyvNvpZInbYdSm+5AkU8NM3uxDy04vtjSBIH
oDqQGcAFTdOkGdWv2TQs9tFQDwaPGhVghrrCcBRRoF3Ci0WPlkwmtAs63tPnlSNvwD7dmHjwg7sl
mzx40wQUOiogQEy0M3nYQgbR8rqAH6KdKCvYQ6JG8DKAzIH4nr38JQbeGpgLnsZCiI+XCTuLelKl
QIddUx3QhdFHqqOQQt/LNzWQanLVqzGeHMW4jiz0l6f0MfN86uiLI1/gmFo5c5zLVr4YVqJ7xJfM
t7fZxmHWMGzwfJN01fhL60eBnSEfj1OxMqqqc1CKnjHKIjlHD0KE8m36+11/vPufx9fH57c//vHt
6Y+nj8fn/xURAK2PlsyDSyNaEESVOspWRksHMK06TfeT17hvv3+Itx++XX9/euWf2/fHb09vRgW0
JqZl2zX4w4MAb9Psvl07xU+wajM+0oPA8Pj94+f71X59Srah21f7CCKrGA3vTyGLApuqOsDPtMjq
uLI5+HxS7bVug78vq7bM0WekhuyO8qELW5SjhonBTEdEX0Hn4uW+6TAkr6UUV27Q/CaZEU3YmYmk
YNo3Kj2opEogLfs6SwIvazN//gsRhDAiqHV2DgDU6Rkk6O6fUWBOT14ExRb/iGZcjNbkYl2GVObQ
4+vXp+fnx/e/TAEz/QmT+tv16xtE0/z73ff3Nz6zf7xxmRMepXh5+lOzUxhHWN4Cm/MoT+PAt1QY
Tk64lo2QSZLE1rzrizQKSJjZq1UgaGgXiddd42sBWYftrPN9z5r0WcdFlBCjVj5NrUpVR596aZlR
f2ViB94QP0B2l1PNDJd0C/YTO9mxoXFXN9g947jid58vq3594Uzq6P/aWMpY+3k3Marb2FBAmkYh
w4NTaylnzVbNzdRDwXfC7DRJ9jFywKw5AeTIszazgYytLYBYYM3FgYylWPVMlXInovo02USMInvc
7juPoOENhtnJVRte3Sg2s+O9HRN7/5Zke3nAtRJfZsjyGBBo3MLm3IQksHMFcmiv0WMTe569ok+U
2aPRn5LEs0ZUUJHeAjp6azkugrNPqVUhvlkmVFh5KFMPJvejNvetbyT0pb3VZGcayp1JP1lAJ/j1
dSFvio8qszYYMe9jfDnEKLcfoKvET5ApAECIHqCPeOKzxNrB0nvGkJm27Rj1kN6ZekLpnacXvtv8
5/pyff24g1fhrG46NHkUeD6xtlYJDFE9tHLsPOdP1j8ky9c3zsP3ODA3GYtFNrM4pFv80avlzKQg
mLd3Hz9fr+92CXDwyKckJWbkkdGCz0gqv8hPP75e+cf49foG7y5en78rWZsjwPVhZJzrkMaoZdsg
ulFLMuFyDDywlXtUkxfcVZHNfHy5vv8/ZdfS5DaOpP9KnfY2sSIpUtRszAEiKQkuvoagJMoXRbW7
uu2Yssthu2PG++s3EyApPBIs72F6XPml8EwACTAfT1DBFzhFfHo3a3te4ztr6ayvTFDkI49jYkfg
FQwkHSpRY9i+wRBTd/w7vFnTFS+NZjVEAXFOIz2irql3OHZWdHNehczd7JtzmKxXbh1Ij5e6jAxk
ACINJhoB40C0IU481JhqGdD9p52EHaWrOSeWFfed22NyqTHQhlN3hu0ywyaM6agyM8Mm9CtdAHtm
aPNW0zcbMjLmBKcptRqQThqQTvCWnKxt4p7iQN1EznHdnIMojZ0pOoskCYlFUvXbakUaVWu4q/wj
OdCf62Zyi4anLrlfrUhyEFBln1dmRBYNIB9d7jjRKNGtolWbRc4A1k1Tr4IJcvbiqilpm2fF0OUs
qzwmGzqHf2y7d/G6Jvop4seEUV+tNdhRHoC6LrKDc9wDPd6xvU2GPdx5UunT4jHVzxH6nJBHSAk0
KhDEpJDE6eLQsMdNtHCHyi/bTeCINlKT1B0voKerze2cVeRpbTRVtnX/8vT9I/XcM7UebYCoz/IK
RzvnhBAZtE9bJ2QbzBqV/tFyW0u4Kxg2Zr4pTV/tVNP/+v7j9fOn/33GhzWplTifxSQ/Jopt9SyG
Ooa39jQ0vMlMNA23S6CuhLvlbgIvuk3N4HgGXLB44wmv7/KRzjoaV9WHpo+ihSWe/kks8mJhknix
IPJ0/J99sAo89Q3yi4YPi1cr7+/WXqwaSvhhLJbQjWN3MKLZei1SU101cFSUaZ8IRxACT7/22cra
8R2Uju/nsJGeSm47QrodxTiEnvJBC/U4kOjjkaadSKCcBZME1ZQT2xqnorlYw0CPOK9jvN8GkUeS
u9TIcG1Nc7QKur1HJKsgD2AEzRcvh2MHHVuTWxy1D8kNqn99ffmO6W5h+3t+ef368OX53w9/fHv9
8gN+aWx7vkdNyXP49vT1IzpLEVl52YGyaT8f2I11WoDmkSDfZg/tSfwjSLQ9HEBx4T1mQm3owB95
Z5ww6toKNP0kmS6gGlmdOd/gMH347a8//oBNPbevXPvdLatyDDF8by3Q6qbn+6tO0i1C9ryrZJ5z
mCTKZxAKyHWfMKwE/rfnZdkpOyETyJr2CsUxB+AVOxS7kps/EVdBl4UAWRYCdFn7piv4ob4VNcib
kVkQwF3TH0eEnBZkgf9zOe441NeXxb14qxeNHmcNh63YF11X5DfdBB7oxyI77bSnDvw9yI2R9xNb
w7LHkh+OZh+rJi+ghLI1vjoA0PNSjkivwqO44vJxylfuRBTACeJddzI8kIHYVpSajNzXXdGFK92z
Sac6AsO6zOguE7yEITR7xivR99akwbAEtCU7goWg9FuU+LV5DuCgHzy8GGcLvzwJq2oB+xS6tXtq
AGWNm3KpSLYP1x3w+S7dOegZ7/iZOQTT7GsiTtEk9NolMJdM18/xxq+XVhbpKt6k5vSyDtZpg8Zg
2dEaXTd3mdEEBoqtd9Wx/hqQxhcKMwWnv94yW0iQOOVVLTPPHiaZBuKXbwyNiKyuigjF29cZwc6M
/PyJGBfmoufiFplWxxM1oF8rUOg580F10cC2yL1te7x6kigAFuV77/SdmyZvGuoGimCfJmFk7kQd
XGRqZ5Y8ebXlPkMpXErkKvs0G2lwjLLqVpzN8JwGmJ1E31CfSKGUQ4FWhj9tyq0cCKJ+H9aI9haD
MZlO/mE85ZQpMq6+XQWl9evY1BqxpjFrjl8YpCcjXWxVwJqsm6owGo+Zf43IvneatDI4WFv3hLnb
mroJekRdwOa52phnZLUJQt12llRm5Lm1e/rwr5dPf3788fBfD7iiR/tax8gBsNHiMC/OPNMmFBE3
x/K81u1fzf26czz2eUhe37VCjB2RqKXV0y3eyaP34GeqWuU/SE74nUkmZllsmjQ+vxiRJe+gYEem
R8S5I645vFapigG0WC3wpKmdbc4AN28UYDuo3iHpuLdidOMkSDnUaSxtGuvJtLRpYnXedIxu9eQ4
8saULKbImpisAFD3pp1hYDdlS/dtlycB6RqnDVuXDVldU2WP7thUv1E8tIe6N1addv/ByMbaYjvm
pt9S2Rysg2aswbl9TSWI5lRrtjHyz1sjhBMhwEQwjCmsZE6mlzEKrGXkAN1KHUltVpmEvGJFfcAT
xIGOl7xoTVLHLhUobiYRFh60ChrY7Pdlw6xGvFM5SS3KaDBtmEsL1U8MMmwSKz7APbrR7a/HvniJ
sBWeoFdmsO4RlsNCCrfsdbeM59eaYZAj6SfgyWYAbJPzCZxnN0aGMpLN6Zrsthdmd88YzkYUEvRj
vO4f7d75FG75S5Xf1ixOWX/tTnu7JIFuAHVGp9LCKWlP61VwOzHd7UZOYFtGN7zYGdTz4NJYtt3c
7jZbequUiZmnaoE37kplTzHIQXLLRWuLA7e7xvIgJT2RJVgK+y1LkgU/ttw72aznfCDzls2gvMZa
C4yd0lR/zpxooVs/UOm0OwheQrOMXZ9uBrsISbw1ZwyL3WS0ZipXM1sFpPW0BCuuQm7pMz5c4S7i
zq+i283IxDpMyeQACrS8IO5UUPYvOL/en8ZxZI2lihBoGedJoB/23JE61pXM8/UF8YPMHOGpvmRX
/LG1t8oS1yZRFmPR1K/XdotAxqkrvNoSmc1dZMcm8q1+Xuf8YI2Cotljo6j5O5p3oJktclGLINqs
KGJgN3tfpeR3VLkXq/Vs7s9A85x+N1Btg409uDIgXDo4a2qi+wp7bLpDEJqumnKymtI3K+WQrJN1
IZyJ5AMjXe0QrKtQN6pTu9ZwtA7ujrc9193EJLEqIqd9QNzSL0gzGlOvXHKf5iwN3RU4ktUe5v0p
3MwaYUnTeQhDp4XXao8J7+0n4WP+N2l/pMUBk/PNzCKBcH/8KHLrgERUzqwrN0xpNF5ZYzfQrSTB
PjJUoaiw7IrFAloMbntDJcg+aRGVhx0mai/74tHtlIKV8yjVeoULfqhAF6WuwCbj2d0i7iAqsG+W
MD+R0ig6mOGTpg9nK2XH6WkC4pEn/ZTJKL+mvNlawaNVvPbKiguMSdFlnnaVv+OedcAQJTlaUH5Z
1HA76mECK/1WP8ut266uIKpFAYAjGAp8X5g1qtrqY9mbwqPouQwxJeXTGlT0wvCNowpi7NOlGmtc
MIbntLjMq8FPm21S+12kb9oGZPjqIhjV062Q2TeKkShTxvLQ2U51WLQ5p7xIZr4KNc2WKB+A7D2c
0Zsw2FbDNo3ijQziTdammLserb8k19tVRv+hK+2KuuHdEkY2Q4URBkZPzbuskukGYLxulyMXfWnf
/fIC9o5afvkiBlVD28z9Xides9Gi/o/Xbw/7b8/P3z88vTw/ZO1p9p7IXj9/fv2isY4evcRP/m5u
8kJeg0rQsztCIBERjJARBKp/ChoAva/ig6c04SlNihMNFf4m8GzPnQNn/h12yn9PHLmG7Oy7ayEL
rwbZoZPh4rA4KZa2E2K62CQMMLKe92olazq46xaIsgRuX7o0DLO2kGDLOtjwQHgVh9N95JHjDsUv
N2xkWyinBcGHxcMbuWd2NeZmYr4lI3+kQheLHnetsjgXJdF7yZOxvrV7iI7yfVPByO55eH9+/RWm
m3OR8jGOm6bbX9X0R7g7PNLBX21OOuOSycXaX+F63P0K16H03zO1ga1/paxs/0tcFZzWv8hX+jS5
6aSaEjOgUkeI9gjqD+EmJpNt7Tte1Hl5Ba2wPtxqVhXOoxT+ouof4YqenQWZvm5kEs1eF1OnEMQt
zZrk8QTX1lmaPSVyiMhHJnyc2hULz18zMzS1aYtuId6Ixu+rU43n1HX3cCJDA4Nyicel8oXRrV8W
AwqTv7KbOiYr8ugmIyofHtBEAwSoX3hR1H7yljYz9Pv2wMZ6bZkL8fIA/5a7xWjmA4oxmTBwlvLp
DW5pKeTsdDv1vCQqRQxu9aEfMd0vDHSjW3GZyOBFkgXEX5fpt2UggZFX1ELgyrgAqurcUX1cB4En
T/KdZU36ZmgMcey8CI1IEnjyQ2ssa98dXzHEUZoQPXuM45gajjKLEz0K3gTs8jClAbgpZY1Lz0QU
l+6jxR0ikzQbHGtfqbG/VN+DpuJYh+WaEA8JxIS8jYBv/hXsv9reefzvNDMPGeFR56DHYx0mnuFY
h+QXSYPB0+eNZ4UhNgyE3IzAwkBFgfdde+JY062J1luKjh7LKwIYwtUmdF62ZCJHvAIujbK6I7pl
5pX9rIDUQmwCak6AHlJdKUQaBQnVMETC1BMJe76t91Wycl5VlRJSN7fuMVpFy2KGXqTpioxtb7DA
BZm5zZdQvCI6LBHdwdcAtqEPiTbEfjIhPlGacZFf3uzIlhAQ1VoKEFW6DZLbJcvvj3MLPGNEN5cJ
rtVBkhISgMAmJQRsBOhFJ8EtccEdAf+vjPAWFuD9VbSiBmcE/L+CHhNCMyHe38XBKqR/Fwch8bAy
Aj7pgFUQkRZ3M0MJpxi5iroedqj0DbHCh6GAOE+R7is2tlwZCYaUOJQUHdtDF4upEd9q7CYgpFCS
x3IJKPaQ6V+IQ1+aPhczgu/XzndaHaGFYka7Av5B/hyts24M/gv3Z/vxS+OYHlEctNuPOvtbGvH0
SuSWIaowWtGmjDpPsgrf2NaBax1Tm6foWRQS6xfpMTXePb8JRqjuPRNhHJOamISSJQUSOTYJselL
wP70NwIyLwldXbwJKLtjg8P+vDoCoOlS7cDoK9Sh3e/ZNt1QwD2oySJIi+fMEAUDMTt3OByo1urw
WxWQ0jvCeTYEpHvtzCciFoabgqhAKG3Ng9CXERntJaLd1CeeS5XGZGwLnSGMqOIlQjmV6wwpIRcY
TYba5JAeEoqqjD7j4Y+IVYh0SplDeux89JqRJS1Txsch1wci6dJqBIaU0sAU3XcoYijf1Rst2q7I
aUfEE+HeYFm+AyHL5o3Z3W7o2dqmxIF0EcwM3TEB7+VrzDZpQ+JERc1vExM7ggzwTkyyHfhdoycJ
Ofk1O6U+E3edJ15cuzVlMDQDVNcUQE5h37IENBsytN3EU7ZoMwyjis+cHXGbVwznO+5Uozi6QXEs
DoBi7UnWyVnOeNAyWqPO9ox1OflWdYdNQB34h461xwk1GjaQQcLlu9lOfhtXpgs8d221gag/0sKf
t518CbzKj8j1oadfqoGxYxcSOh1JjzUsevrMPaVd+/r84dPTi2wZ8QCIv2BrzLLtawL0MTvJePoL
HN2JNv6XqG2y7aKcfhSVuDjRr8sSPOE3dC+8K8pHTnvfKLhv2tt+72fgh11RL3Ggs2NHxzZUMIe/
FvCmE2yh81lz8mXhOsoYeRkrS3/xbdfk/LG4+gfQNakwYRjenqMV9W5lbUkm31VaAHhxkONDU3dc
+OWgqMTSQBelx3lRgUXW0DE2FUzvNxJ7D+PjRQ9FteNmPkkT33f+ag9l0/FmQXqPTekLlIrwmZ9Z
mdMfcWT5fZJGfuGAfi2v2serfzZOWdn4/KkQv7AS1s5C04sLxv/1F3C4diBZHtc4ZOAZy/3t470f
e8d2nV+k+wuvjwuy9FjUgsOWvNC0MpMWQ3688EtMWdTN2S+OOOqLm7F0c6tAqvz9r2BuuoXmV+wq
A9F7GbpCrVd/CRzOZdHs6RQFkqPBr+4LK6s6lT1fls+698t+3XecDuGPaNMtrauW1T1s27A6/dPU
FjUMcu3vYFv0rLzW/lOvhZ3fcsk0cdjQcJp45t8ggOeKDidL66TtOOitC3MJlSwspK7JMubvJpxO
S0MpWCVOtX8ixNLhJ9qiQJf9heL7whM6eUSLUoCu4/n8LHlUaGt/96uF/RWzBzGxcDyKinX9u+a6
WAWcn/71DpuoKBa2i/4Ie5F/CPpjdxK9cujw7+WoRd5aQX8qlBzh/n3hUcrVbr90vF44r5qF/Xjg
sJa8KFa8OH7vrzleA/wrQMCOjbnzTrTto9QTy9ZfQZXBbTC0wuRMpgGE9izVZ7S0JJV9GdLaVfhb
Tk/yyJ4XZ7J+uxpZNz4YmnXPxeG3f6WRe7xUJoaGVrXu8O3QgPI4kK1yGjBbwOpN1XrYHDPuiyFh
ZuHQiKNzz09zsDB7ir35a/CpbPl4ITOKqmvlgmiQWZcdb0cmbscsN+q2K7VsafQi6hrOiaxQXinS
qVbMccqNMJI4lU7aFSxitDm+YVwLLqxB2EOxvOa93Mi5aTIkf+z1QtOHvz/YvwOSvB6csr6ESv0/
vOVcsB3O2zDa0cFCo0rbC19AfjTOl3N2KDCr7M6dapl86QQHQo32p3Dq/SM0K6jM9X9fgq/ffzxk
99QxTgZxOfvJZlit5CRb8fkHlMsjGTgB4WKETamR1K5pehyJmxm4Y8b7HiVCwP1wsfC9KInCj7oL
t9XkZjiFwerYLjSbizYIksGR6tse5gkNP4mRaJZHQpRpELgFzmSos6GgzFqIXcqSJN5u3FHFQnZZ
xVyqEDuXKEPQVyqSwSwNypP+IXt5+k4G15OiZke505d5J41FPWNwySuzHX01v7LUcAD+/UGlfGg6
jIPx+/NXDM/0gHbQmeAPv/3142FXPuIecRP5w+enn5O19NPL99eH354fvjw///78+/9Atc9GScfn
l6/Srvfz67fnh09f/ng1xXvks4ZfEd24KDo4eqD45nwqgvVsz5w1P8F7UJMyMtiEzsVFHupfAXUM
/s16WyAnUOR5t6K+j9pMcUyX/u5UteLY9DTKSnbKma/ypi6cOwrB9si6itHjP76M3GAMsx3NUtQw
BLskND8XyMOMCXLX45+f/vz05U86TVWVZ6k90vLChr5G5hzy1peHT26beS2o/HETRn0xkJXJNZp3
VoIbRW7EnMajfXn6AWL9+eHw8tfzQ/n08/nbtCQquZorBiL/+7MWjVEuUt7AvJRXczDzSxa5lIX6
1EnxIFwdav4xKEFupA+bzZcRJjtiXOnC2s8m6tQwCqpE5fkRrwYP4vg2GWhfHDpHxvGU2JjfbmYB
wyFxg2VJkRQCv7/aewFUzlxzXCzKVILIMouKJ6HdPCCSqYblHp6fevPbvWrEWRQ+vbAsDk2Przbm
oJf2MTSt1+y6yZLIEfsrvhz4DxCe+59m5AHc59x5ytQ7ho/hoHDhxf/eLkm9VXtQF+Cmlx1Zdyic
znPQn3bnA31ZlV31X0B6DOMCuuuuw/SdPq2iubCu401nHYJwENsqjCh6dUDv+dCfOuto4gJDcOwv
JvUKfIOjSr2XozbQnw/lhnJCmdyFcTDQ1z/JJEBDhn9E8Yq+BOtM62TlS7IlE0rB1MiYqe76ZY14
LK66QtJ+/Pn90we4P8rdjZb+9qhtZXXTKsU0K/jZHg28wPjSIPfseG7sq8tMlNvNbXed7hoLimM0
ZiHWLqCeXliNY/mhoArur62eVUT+eeuzVtvkZpruCaOIXR9sgsBwglOASq3tq08Vhl90uVPPHiVB
twJX5FOm+4LhX7csMzwsJc3jMqHKOOaREDJBx0+7vSrhb0oZtygG0Z8wdIXM/jYLUP/z6/Pfsofq
r5cfn76+PP/n+dt/58/aXw/i359+fPjoPkOMg3Qa4LyMZIfjKLQn9v9but0shkk2vzz9eH6o4Jx2
xVs1Im9By+orI7epQsbgf3eUap2nEuNW0cD+qGKP2msGITG6jeBtj1z+VUVZYFVFJXqeaQ7aE2XW
qsdUUqCY/xQ/Pn34lzsE809OtWB7VLnFqdI2xErALfy2w0gcWj1ipjg1vHnjnWvs+b6ConQJnrF3
UiOsbxEpkDNbF29DovvjvWH0XHNLn/CT6Y487XHFxfLXlw8EVmLVO02lzSUR+RUha0r9UJLwrsMz
psaT/HjBrbk+yIBgKvZ6QX4Klz9krA9CT057xVDD3hFvKUdqhYsoWcfMag+7hCs9k6JqJHrqhkZA
9js9pv1GJAMGUCet5e9oaNUlY6tTxK1uQzhTV4FNxf3WtM2S5DZjWzqRo4TNNzdVfBtt12unICR7
XCVGPF6RIUknNB4GJx7QjIUBUSGQqTvMjCbOeLWpkYh0Ihrm4vdhie0xHKlWMLQZ+j/GnmS5bV3Z
X1FldW5V8qKJErW4CxKkJMacTFJTNizFVhzVsSWXLL9z8r7+oQGCxNCQs4mj7gaIsdFo9DAZ6QV4
UDow6axW+t5oQ+npQEdvthKLj0HaVO36igyGbt/odTVyZvrabULiGaNaEW/ioCHbODomzmygBhbh
y8vbTqe0pK0gxxvNgLXu/KsBs0pRNfDyYTofDvyEGF+GaId0F9g+HJWjwTweDWZmmxvUUF2WGoth
mpsfz8fT338NeJ7OYuH3mifi99MjnLLmI0Pvr+715z9S1Ec2SSCGJuYIxtsCvf4wLLigGkXSiExd
37qpqoiO78qyqYB1TM1NRcFD1JSPoctFMhqw/CxSHgnIU1adL1TOuMWYi8p1VMO5dqCry/HpSTkD
ZY2zfs4IRbQIiqet3wab0bNjmWHyrEK2DL2i8kOvsnyki2v8guJJvrKU9EgVrSM5CLCCblgI3njx
ooAozY+vV8jW/ta78kHrVmF6uPJ06pCK/efxqfcXjO11f3k6XP9jTEc7ivTqWEah5aVc7atHBxy/
nyp0uWczHFHI0rDSXs3wysDQLrUNchMSzNK3aoeuNx92M7Ypta/4/L64kLivRwiVSSI/imFqOxO9
/d/vrzDub+fnQ+/t9XB4+KV4KOMU0rsd/TeNfC/FFPhh4BEWUIBecEtSrCQ9JEMZr28A1WjicOGR
HUR7nytvUAxphBtU0V4STCcYl2HYcLqVg/I2MEcWSxgscofu1MlN6GzqbI0mRaM+mla8QQ7lAO4c
Fo4GJnQ7cvUPOkou1bZpE71o4Q4nagDBprzWMB09uNHu6Uj+dlGRWgmdD4CEDMYTd+CaGC5gSwMF
wCWpsnKHaRQASzFVtiRqPQ1QhBD+dLk+9D+ptdriTwIuXdN7glj6FNA7nijT+blXFNlASC9t83bB
6XCIiYmAeRxRpS0CXq+isIaYoujgs1YXa6bXMTY9vHdDS5GzSZRz3Txx+9giFxSe7zvfw3Kkt4/j
wuw79sjREWxp7WqHGbwcTWV7bwEPSjUItQqvCWXYq2KH46djrIkcU28CnNNLZJMpLsYLkuUucZ0J
JnkLCirsTWbyXpQQ7qw/NfvLEDMXaziXHFHrbUFS3LlyJuQWXDpECWkgEFEZU16BlOCI4dBseYOZ
mJgthTsmOCdz5gyDI5SMSgpmZMVMbJW5CCIZDyq3j44nw+gLQSPygym9hyhX2xZ1PxpiT47tDtzE
4/6ob3aiyku3r2THE5iSXnhnfQ/72jyxOJa3k0w3lhqdTsI4aIRSuejQMZsTJqP+cIpWuaYY/GIv
k6D36Y7A1bJJtcPgYK+wLTagO98VojdkSFNZmswypQgivzt6ENRNVmgwgNGw0TSimHq50Yw5zCU5
hMTBxpJkgzcjQ+vAzj6su9hOIBSh/iD4AW8nSWY7IBuWB7mXMV7qDAYWXuo4+EuEzEddp557SaQa
+Jt00zHCb4JyOJY9wVq4piBQ4AgbAvgEX23V3WBaeZgzdccq3IqNDMJE3GqEu0HJJJYcry1JmUyG
49unjX8/prv01prIHdJHmAqsKOQIavMEaPDvu/Q+ycX2Op++0Kvd7Z0CBu6pmoOh5VoV/V9/gMuJ
be+ryWg2vc1MqMA4MMQZ0DOUPCflBysfy8LRkASJ15m7GbBWQ25i1oryHB75jWxeEI2cR5xUahBJ
P5g+Nw1j9cs8PJoCyebdb9BIF/C4vggSJZNCsGHxIynUkj4GQvdBM80x4M8KEUVOxt2XcrKE2uQ9
k8fbWquixTURn/j6qYPcRsfyWizhY3WySLDDt6OQhmHDeiayCahQuYmCEDd1XJarWqm3pCJ4IFtr
8bGIOVE7teT5eDhdlbXllbuUgHefraMBhLVFpHAK91dz04aS1TePYjVbwobB8dfepiZ0UVNEnWTr
sMsdJzcMsPbbbkNQhvEceoCbHDdEy9DTbZKby77Wz3YBr7bCMqCdBbAFUEwYlsF4PKXSWauz64yQ
OQbp9F1JOY0kzPLfNVMJ9P8dTV0NIQw0RRvm3gIOwLFkpdfB6gLyZQz7kqoigTVAokjPWNU1tRpM
7tD4T7SEHPEs9wqWWyH30jCWwfSnQHaBdRtwkbG14qhg/kRUJ2FZKrZ0HOuDtafAfZIuu80E1H4M
SS/Q3sgkmGwi4flDl/pt5QE6wu3ogS/eSJYAaPnBgf9mOY8UJUEDT8J0hRHjFTC9kIHyIbKxugAb
DAufbW1knSTyg5EEFPkdJSPrruogx1nJmtk9QIcMbsJC/r2df157y9+vh8uXde/p/fB2xYzql7s8
LHD7/I9q6SpZFOHOt7g5lJVHDzucp2zdSRcBtOk7Mnx5wlV83UyIs7vOo1xhjWRZZEnYVorVloRx
7KXZFkkkxZ8Z6mVWQWYV5fmXY9Q1Knq4KuYekT6q8OoGOWoicWc5rcfm8ySImwbcpKF7fVT7q8rm
zCfovAWdnYXF9mkJccFJLCl36Q/QJ9EFfrfKO7AghMDelPlITIRzY62SFiZEyhcEJZQX8jir6NnY
xeVoiYzpNzDW05GUkcPjq2HlAengeaRVqgH28qOSjMdoRylmqqgbJBwJSDhFU5FoRLOhgw4wKVlu
Tjn6t/zpYZKXcowQAFabeNIf99ECIC7SvzypiYlWnlsl+Jo4KNwPpgN3u7V0fh5tw4BxQHz8Y/bC
UJPFCmcfXLpcExy93NCLfarngeHM7/n88HevPL9fHjDTHng9UwRsDmHhYJWtUhZMQe6MFGi4rnQo
+1kzuxeZ0o8DpDzUys6KjjGBRQuYvFKGV4E0Ihk7oX1pC3pR7GfK+LcMN1ni45YTzGJI3DF8OT1K
U71mKBnRGV5JLy88RfPhdLgcH3oM2cv3Twf2WKcYKYt8Yh+QSvIW+xITWuemOXlxeDlfD6+X8wN6
DwzBsw907ejphxTmlb6+vD0hF9+c3r6U6y4AmACE3c8ZMpWV/wzCbjkL9blNxwBAxzZSkGRkpjaz
Paogz9omKlrPErpsTo+b4+UgXVS7I0RQ8wsQdvS1FNC+Vv9Gh/Sv8vfb9fDSy0498uv4+h941ns4
/qSz2hl18RzZL8/nJwqGMO/yLIlc2QiaJ5O8nPePD+cXW0EUz/1ZtvnXLoz8/fkS3dsq+YiUPzv/
T7K1VWDgGDI8sfUcH68HjvXfj8/wTt0OkrG+4qgKJc0M+8ljfmbgah3HsvV3g135ILOwDBzjrkl/
/nHW1vv3/TMdRus4o3h5DdH7sJkGZ3t8Pp7+tdWJYdvn4j9aXBI3Y5LlvAjvsZfHbUWYGyafln+v
D+eT8LQKTJbByekZmQ9dXNPdUMxLj8ou6FsnJ9BNHBpwo3RJq9F4hskEDRkVjQZjZyq9FXWI0chR
YuJ2GGZjdKvVjMYdY5fThiKvUmfgyK/BHF5U7mw68oz2lInj9IdIc4TJt/1TlIKuHLDuVS2OE8q2
LVFpIosckVaYqeaa3hPAmbaZfPqT8ozj4xM680BMvNmAbNGQ04CuymgwlnJrA2zu3YXKB877y6Np
1rpOIqCeun1H8FCgNhaiWNIb6QCgP/SHZAAZvnEA5OlVlvRGTuA3fvq3dBXBvQ5Y9Rtc/QQ4UCrO
K+y5BrCNLm2hdSG6LyfDvrSCAMjMKUcqYZyXpQlR7/AdtLviKU1kFonq3UIezirJQ7U2KjIrOk8O
0qOh8Af14r73QLmSabdOMSDDyXpbKgJLT/2gSKYyFqWTBTyjwra+HJKMKg7hfgaxwSo6GkMtwSPz
YqJFMlKhqaWLEDxblNNEEpUA5xckKSsffhFLYCpO2OTFwKN7cRKI17krCWLElS93VND78cY4fDd2
Il+T4lEiAamInEd1wNGdUgkcW+gNAio1u+yTpL7LUo852bCau9VHa2zeMGp6dS544nMEqX9RxpVR
WBSYbl0h8uK1YqYFSNhCUbJ1k3uLnTnv8RZyc0j9lpD51quHbpow1x+9gS0SOo7vY6jfy/NlloZ1
EiSTCWq5A2QZCeOsggUWqJorQDKxlXsgWb8j0UTYzQNomP/IUA4LCNCWl8Cl0s/UEeiQYZIQeUOp
S0xqDGhoiIdlTEmIpAGmP9TENgCIcyJ4d364wNPr/kSZ98v5dLyeL1hqjltk7a70JGYHDlzqL3H1
qTdFVIU6LvHExYxL2qfHy/n42O0pLw2KLJLc3htA7UcpZUSUWSgrR8XOMd2aVoFQZ376cQQzzM+/
/mn+87+nR/6/T/ZPt08N8tSJPrSPGp4kFIPiCgDtvAhzLPmnaebXgHNIfxd4qJkBT7Zdh3BdTLT6
Idtke/VZbnrXy/4BHJgRZWuJnopN3hdJOS4guhNKC7c4arX4RSX5lLTQpFwh0LyKkC938oMIf2L2
TBSCdC1yMxtVQQ7TaDhhd2+PkOQlWRSCnKyxjceo/CIKVLfQpgz4538PG/wtHVEOi5FkqzxGQyCw
r3DFrPyVbC5jbOWCufQ+IyD1PAlxKPRZ/oiCM3uCUbUt1ZHefIVA0ygTbmJUYqjTkZb8uSW0pVWa
lzi8CrGmllEmbUr4BTKKceUp4yixPRqwUBX0/2lIsPcUAuHL5ODnVNys71dewPNsC67cKs2oJEvP
25y563boTNZZwS9+CAWK+wGDE1sII01C54b/RzBiZmeL/OxPPLIM601WBI2htHRT8OIo8Cp6XSjh
Za+Ur/IUFGUQCl6+cg0hnbp6qQJQvfWqClveFD8yi4zY97Iy2tIWYSKhoClDsiq4TXeHGfMKVUBX
nUEr1yK3Ymw1qP3mB5IxD/zSLS9orYnPBlYycQmjEk4nrb8tmBJbEoO3JCxhfZTOsdupVD0fblVO
7pDowKKUYmCwITD68e2DOfuGzhdAtbFjhBB/D9wapcW45Z+UegWQRplbr/Eo6EByv8oqTNjd4ssC
wGrsDYBkKXsHZZb8lrq0fgDIK+lgVvS2DSlJutvBvBxqXckIh6Gd8Cs+Ich30yhuKutYztCYGwaC
McUraUqYy0Ygbi8ZQYUtF5WILXFbL3k1zIUmSr9R/mo52ZqviQS4USb5mQhk/D3DgGMUuCRYn7+X
FW4oIX2jsEQp+U4vJ7YZg4Uiy4Y23gSrWvP6aGDcTbnOcrT6KA7Zc06USmsxoVIsvLTuLHhaKb3z
Fbu8UodTBlPRZiEvs7JehzrbbIE37HU6Gn8VxVWUQnKR1IMzEB+v1iZInFg6IOIA7m7XNd4zjYkM
VqBiwL2JvWSwYx5eqTGDL6AklTRZEEhtXqrnDoepG5O2TwEQCkCMNdBlk9Exi71dLavTOhhEj40K
umdq+kfhKwiJF2+8HW1aFscZrgqRSsGtB3OwkEiSkI5HlreeVWT/8Es2LJyX4iSU1gCXOoAnWbhB
QwG5lLNFgd5+BI2hUhSIzAc+Ulti7TEa2A/ylLQws1YJh7aqe/jkA8AHI/hCb2Zfg3XA5C9D/IrK
bDaZ9JV5/ZbFUaicQN8pmYVtroK5wVFFO/Bvc7u+rPxKj6Wv4Rb+TSu8dXN2ZCha7pKWxJfouqWW
SguvSMgdkIMh13g0xfBRBi+SJe32p+Pb2XWd2ZeBZPIlk66que2NY2474tJK24wMoJ3YDFZs5Mvl
zWHiOpW3w/vjufcTGz4mr6njx0B3lgBgDAnqR5m7MCAMHcRjjMB9XK+OXiXioAix05IXhtikEHWz
cWlvq74Li1SeME1dXyW52ngG+EAa4DSGwN8ZP6wWlMn66CwlYTJv4t8rhjzwp5P+hJbKHHhpmUYl
N08Fv7kQNbeivJ5eeu5kKmkpiM9Jv9dD7bfiVcYhFuGXIZXwCxxS4/Y9LM5latnwUBJOksY5NEjR
zjVEMMP0dh2kWl9EfNFVkGPR5igJ5tNKOR4YeNHTO5OUcyBN6D+ht8oH27iyav+HdUknahnGuXx0
l6u0yIn+u17IoUoogAqcAKvvCl/NtsnJRR+jlEmmEPOPQAgcizlgU8gqt5AwX+LMhUSquA2/+dGG
PckxLFhqbrqWtQadah2b0APLJoiWi0dsZ1SrHBJS2PG2yzdDmqdcC8UV8B2+DlZJXlszXXDCP2hf
uUk/pGlOdIs1XODZLhWeIYa3qFluOSpkFwf6Q5w7ysEkocXJVtOTTS3YYqYM0+0uBTfFXvsUEld+
2NYwQyvGsWKk53kVM7F+ZzKwYobWrrkT/FVfI8LMFzUSx9riyY2vY769CslsNLF0a6bGBdVK4TtD
JRp/+HV3Ola7RYU8WF+1a+ntYGhdCBSlzRCz9sfrH+hdEwiMXcn4ka0grnyRKWyLXOC1iRDgKd6D
mT7rbdcwGxGFYGwtamviXRa5daEXY1DcThHQ4NVDhW806KTAkxACaakd53B6/VwVmf5Jhisyr4os
qVRaol0RxXGEW0IIooUXfkhShJY8FIIiIhBYE5MVWop0FVVmH9nYKCHpBaZaFXeR7JEBCJD55eEI
YjT2cRoRHp1aBdRpViReHH1nWT269zvJLFFRjnNjwcPD++V4/W36PsGRJwvRO7hc368g9ia/6coC
Oo8vT2cUCIsoXVh0fE1NSK8qSDcRBvyzsqacq2YaDFKQgutgWWe0Dazjqv1/o62rgyQsmfVDVUQE
jzNwQxEsUOpFYU7lSdDIlNmqQJUoTMFLmMYGohAaAiCGhrAyy/9++vr243j6+v52uECc4i+/Ds+v
0nOtuCR23ZOjqsRl8t9PYJb8eP7n9Pn3/mX/+fm8f3w9nj6/7X8eaAOPj58hNMYTzPznH68/P/HF
cHe4nA7PvV/7y+PhBE+N3aKQggX2jqfj9bh/Pv7fHrDSLR+SCdBOkTu6FFNlgTAU067FkNQcDSKk
kcLjokQpX4os7RBoezdaK0Z91bfSIqy1rNXxXH6/Xs+9BwiOfr70+CR0/eXEoDH0ZPdQBTw04aEX
oECTtLwjUb6Ul4yGMIssFTcvCWiSFrJutIOhhK14aDTc2hLP1vi7PDepKdCsAbTfJillqVQYMOtt
4Iqk1qBgi2F3A6Vge5ViDpZG9Yv5YOgmK+mxuUGkqzg2qAFoNj1nf40a2B9kUayqJWV/BlwNECyW
RJSYNbSezlyJ8/7j+fjw5e/D794DW9lPl/3rr9/Ggi5Kz6gpMFdVSMymhQQlLILSQ6alTNCrYzMo
q2IdDh1nMBPt996vvw6n6/Fhfz089sIT6wTdvr1/jtdfPe/t7fxwZKhgf90bvSIkMQZ+gcDIkp5u
3rCfZ/FuMOo7BoEXLiKIy2BOQXgfrQ3ykNZGedpa9MJnDiPA1d/MNvoEGSYyxx7jBLIydwKpSqQZ
vkEXFxuDLpubdDm0SyfcViXSVnoabwrUhktsjGU7sMZ6h+w91SpBqoUnMMUGgJv7QIw/y0hyH3SN
DyaeuWS3+KCvNad9rk8+Ph3erubHCjIamjVzMDf9wJGKPkWC0xGPtXBSWqO3SyVwbQP2Y+8uHJoT
yOEmT6MfqwZ9SDRvcDu0fuvUJcHYIE4CBxnXJKL7gRlO4lK54EFJMEBjcIu9tvQG5gak+9aZYGBn
gJyuS29kNLpMRiZhRUURPzNPy03O6+XCwvH1l2In3rILbJ9QqOaYYeLTyLJ2/DjbgP8tMv8cYQTW
FPPtgftt5CEIEOtthcrK5IIAnRjQIDQ5z5wfesbaa/gswkaLXDH4VeF1WYbD2nGReU7GBqzaZPMI
EYkauKGx1dAO84/l83t+eb0c3t4Ukbft9jzm2nx9nuPvFudKjnYtIWba0rjOoUMvb+4i/Xmfu9Dt
T4/nl176/vLjcOHefpogL9ZgCoHqc0xODAp/oXnzy5iG0erN4TgPDfoik2BnGiAM4LcIQnCGYDSf
75APgtxXUyn8hm5ZIxSS9R8RFxbHep0OpHt7l6FtzN5Ju3Y8H39c9vSaczm/X48n5IyLI7/hLgi8
ICZHBkRzFEi5vK00KI5v25vFOQmOaoU6qQZjWSuE9oEDusDSf3FSUWEWHPAGt0hu9cV64nUdlURF
jMhyKC035hIP1/T2H2huygbOcqLIFPSbtxYmkC5CLXerSbKM5mk9ncmxxjEsepEECu7HFCGSUYfF
LhEdFsauP/YQMQloCLkhZwLBvWeeIg2cXmjcmfMvIZa6gYSMtmhYeJ1sMtzeqGX8R5WI5qxNUUxp
DsVjkyHaYSnehmnBGgnJI7YEdTBWBpsKQfhUJSyhd73YmndjDW8+xHnlLkkg/yRhijx4uTQOLHK4
XMG9lN7t3ljM87fj02l/fb8ceg+/Dg9/H09Pipk/e+YGJgYBsstWJYlbj/xB3aJPfpR6xY6n8psL
Zh1buTSYUnpFXUD0H9lnztPM0vyIypcQX0caXuFaRUXPlOS7el78f2XHshs3jvyVYE572AnGmSDr
OcxBz25tS6Ksh9v2RcgkRhBknQSxvcj+/dSDkopkUckeYqRZJYqkyGK9i4J0pNZDotRFG4G2BbqS
VNLat4DKqs3hT4/le6TyOjN9LqkhloEu5nZqUsx4vpmmSdvqeHwu8WBZ5XtNLyCvea2SitWnuORG
V1dyHoSBNn7YJ1QRdVyVvOtOy2BzAiMgN1928cbFCMUcGMw4zQ6ByH5/5f2UUTBue11lRXp76Z4p
AYkxboSS9OckUtaYMeCDxKCqJTHD694diloooUpDWTUTmgwrV/5v+8htbhp1He7wcgO2pXbcWO74
UvZagQteXVndVgwLCdtfq9jA7Ortai/I+6qAmzts9n9jNiS5graVgtI6LS7OIlROgj7bmMi0Rlvb
eIRDFACGDjZ50Jpm/1aG42evs9BtmvPhToa4CkB95yTv2wA3dxF8o7bjuoYHmxT7CfttLUNO+j65
5VMtDvQwmKyCQ3xdzISwgZAQAIGQMWPcRL7vDuHAdidpYFsU+TxwbkaghofRKddEORwxUHMvvx6+
YU6LNgPppdfSCA+HmucpTk83zb0zsvxKUsTapO4v5SC1tfVIX/qs7+bRLYpa9VfIiWpXdNNVTqY1
+FHmoneM6sOAJbgmnKWG5V++3XUuK+wurYdixLw7pswTJeYXn5kluXQAI90Y0knSoOBuXbAenNbL
75JWUxPVbC7qIhPzGDBA1Eh/ZOvrl53Oicx+RU150ZnRa2NBCy43uF9eran7BiC1zgdEC2F7UM2n
wV3vWs0WToRav377+PnpEyU2fv9w//ghNLASH3GitZLf2jajp5ButIDbz5B7+6EGtqFeTTP/imJc
Tehp+3rdMpxtMOxhxaCkhHYgnJNRHiZbF3znMEmMWB1YuNBTA3flXPQ9oMsUovQY/AOmKDUDr479
BNFlXXU0H/9z/+vTxwfLvz0S6jtu/xZ+BH6Xlb6DNnQnnzIq77VNboMuNLHQYygE5gBsjU64V5T8
nPTlPMIeJ4OBsLhpHRK2zmP4WGqeheSIOwTJKA1tTomjXfs45ClGAVXdqEYr9PC9Zui7/fPy4o9X
8uR0QOAxyFe6mfZFkpNhDUDyJccCEy6g9z2cT5W48VQGDpNBd9cm4UJ8yxs9CI3JK+HLfZSmz4q5
nNrMRnlUhxbolyCcPKnOUFREuOrcAfsqcnUdXZ742R3oZOWyJCS//+v5A5Vfrj4/Pn17frAJbpdz
m6AYBeINJagIG1dredHicv/52/cLDYtzUeg92DwVAzp6YALpX37xlnEIFnZx80zICuqvGjvhEkKD
YaM7O3btCZ0HlM1AdxZR/RNsT/ku/K08sEoXUzokLXDdbTVWd4U/UoKqH/OnPo+7HOyKHC4EumoH
gq31Y1j7FXcDVe++GYvWhn553SGcWBH1bGN58XPr7mJqhd09mDaWD3TrGo6smsOYEHqDZds9K/S6
1oxzvgnHfNbUIKvMOKKfrTNgatGyyzm9cvTLEL7OAtaL/Ec9kMNJvBvKQRhJu+wgorv9T6D12UQE
8CdQgd4gn2nDrn84Dz796/1x4Zwfu0uBya6BlIXTXSA7w2JmakIWQrvWsyNy4oRTtDlHQ0b3yXUz
d4eRqJVHV66bsIWMstb3zAf1qdLYHUAQPSibY3vvHt2wuJwaXumEATtLxdmyyKVp78TxfYLyR3yf
n1A6QRkrYIGZqx4Ehr2sXLnE68XB8QZ0rA5HGHqMBottgAFyJdDssA8HrLGxGS3xKUHSHGrgGYpn
CZnx1mzEO89dcV5cC+Va9MB1FNsIbDDKI6Z3Csz8iP/CfPn6+M8X9Zd3n56/8iV+fPv5g2TgsZoc
uqoZ0zkKPtGM2QUmYX9gIAlWk0ggjlr7CYndCEdYCtGDKccQuDlUAqPeJcC5SMTOr3L3Q2Q7SpFK
/Zj0uffeyA5G4HycWqwJPuh043wFjBmwZ7nREg1QOXd+lxS29j8CO68Cg/X+mUoVh1coE6JA4UzN
SkTm4hmodOkeIfx2p6LoWIfLOmD06Nm4g388fv34Gb18YOQPz0/33+/hP/dP716+fCkLbpql2vOB
5E2/Ul7XY6mALYhZCIgI6JMzd9HC8sVudDYGwWTjlzmqXcfipggYuyV7r98eQT+fGTIPcN7Jh9VD
6M+DE3zGrWzQcpUqFFtVKHTJAqKTWQoR1kXsaVxpMvNqdRTkosF+x1htj8vZJim1A+vOKp3H1P31
/2yV9YBQQBoQquUyU9vntqkUYdFCde/k7ER9yMdIgoIPglXFiyKHI8Q64J3768ScR4SMfmLm+f3b
p7cvkGt+h8aVQAJHQ43C5vpBzT753mNkKTC+ijFtxDGBlI2sbGb6fur8VAweJYrMw39r1sOitSNI
UUpG5GxSmX0+0NmknHLgEiOB3d4OXR/ERzBDoLYJBUp8pwokEAMifQkkZF1IgF+vtVcX3rt6L8mA
Ay2uhlCXJCdDLvt+WOaWatlZ1EDouLKMTq/I7A4m55sAmQuNlhHrC8zUFgcgqlosCRt14gsIbXY7
Go1gkW/IdgJD8t+ajtet91idVYexD4Xl6o46zqKeK5fDHwfO52o8ov7YZ7g0NJt5ATWXPrpFa0iG
gf7QxuihYEQ4bSLEJDWM30lmH+RefDqYuZcVKXHTqSzl9ItrdCBDfMcCi18RP/wA08jCRetAMGyA
PPRX+uCC/myDFnNcBmdBnPcqB8H9mFUXv//B+QNRcHCYl6TpajWBiJBZKCteZZUphVhme5AYY2uu
TAAhavX98o1GrbxbJ9i44a2kVAFO+vp2UTBPg7SJXb6ZrdqX+FVZBUM+FekrTw+RByi72E2eCj7D
8nN1WtaTNHrSZsMKAP7R3KxxMEo0iWGuRE2/sBluDOvP599uLvWSawKj0JzEVvgUKOJXUERhZuka
6fKR7Xe9hrokSnX5QXSrcxX/fK021f6ceXFIo+cS3GWnTxjhg7ya5c5Xe9DUnjn/ZKiLtcTe3ZPS
/DLePz4hR4UiQvblv/ff3n64l14hp6lVNfALl4BmCNNvSZlEqtNGR9owTEmUKd6fE1FKxcV1PE3X
vhB0f3yb4trNJuVQm6SqWaEXKAsFjvM43UyY6EYbC3bXJKdiiQQM3lWZhQmIvAtwSuSg1d7dgQiN
s99BG82b5fUhbtiyqkcnaohVDEPSZubaUi2ZjqGHOwbNmCPLV4u363a9n/JR54pZoEXPowHoRhyl
qVqq1RbHiD5/omIoA+u0b+NMXLoxGHBkd5i9FH3cd+BkXje1wdoxcWqHx/U6wTt8rzOrz4ywlCzE
vXntJqCVq3IsblA1vLNsbMLlgEo12NRiDZnrNkztJwCMRtuhBLbuXw9OozUiP3hdTVOlK3gJyg4S
cbimPXMxejRpB2pMb7Virs8ErXLdU5T38EnTAS4TRqWXP+HrJmaV4PVArpeyaPkPpp1e4o6B6MpH
BssgE+hy7tGXLUU7pua/4fZWVn0DUu7OknFyojicr+K9/UeBvdGkIbzNGrOzN4APyxLYbPHNS26E
VXg64Elf3+zMHo8mXgmDt4XhspZ9QTdRJcbulRtE4bJbxN/HeHFvzA8CAA==
--===============9104277029946452305==--


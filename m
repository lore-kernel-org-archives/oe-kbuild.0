Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BB128DD5;
	Tue, 26 Sep 2023 15:01:28 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:34354)
	by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1ql9HI-001UMK-Fa; Tue, 26 Sep 2023 08:43:08 -0600
Received: from ip68-227-168-167.om.om.cox.net ([68.227.168.167]:53274 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1ql9HH-00AmvZ-6o; Tue, 26 Sep 2023 08:43:08 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,  Sebastian Ott <sebott@redhat.com>,
  lkp@intel.com,  oe-kbuild-all@lists.linux.dev,  Thomas =?utf-8?Q?Wei?=
 =?utf-8?Q?=C3=9Fschuh?=
 <linux@weissschuh.net>,  Alexander Viro <viro@zeniv.linux.org.uk>,
  Christian Brauner <brauner@kernel.org>,  Kees Cook
 <keescook@chromium.org>,  Mark Brown <broonie@kernel.org>,  Willy Tarreau
 <w@1wt.eu>,  linux-fsdevel@vger.kernel.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org
References: <60c7fdeb-da32-4d21-9e34-368050224d6c@kadam.mountain>
Date: Tue, 26 Sep 2023 09:42:44 -0500
In-Reply-To: <60c7fdeb-da32-4d21-9e34-368050224d6c@kadam.mountain> (Dan
	Carpenter's message of "Tue, 26 Sep 2023 16:49:57 +0300")
Message-ID: <87sf71f123.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-XM-SPF: eid=1ql9HH-00AmvZ-6o;;;mid=<87sf71f123.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.227.168.167;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1/Hj+tqfYmK0zrPxO+Sjh4Gz9DbfrD3sFA=
X-SA-Exim-Connect-IP: 68.227.168.167
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa07.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=8.0 tests=ALL_TRUSTED,BAYES_50,
	DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,XMSubLong,XM_B_SpammyWords,
	XM_B_Unicode shortcircuit=no autolearn=disabled version=3.4.2
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  0.7 XMSubLong Long Subject
	*  0.0 XM_B_Unicode BODY: Testing for specific types of unicode
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.2 XM_B_SpammyWords One or more commonly used spammy words
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Dan Carpenter <dan.carpenter@linaro.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 670 ms - load_scoreonly_sql: 0.03 (0.0%),
	signal_user_changed: 10 (1.5%), b_tie_ro: 9 (1.4%), parse: 1.21 (0.2%),
	 extract_message_metadata: 21 (3.2%), get_uri_detail_list: 3.6 (0.5%),
	tests_pri_-2000: 23 (3.4%), tests_pri_-1000: 2.7 (0.4%),
	tests_pri_-950: 1.32 (0.2%), tests_pri_-900: 1.05 (0.2%),
	tests_pri_-200: 0.87 (0.1%), tests_pri_-100: 17 (2.6%), tests_pri_-90:
	108 (16.2%), check_bayes: 97 (14.5%), b_tokenize: 13 (2.0%),
	b_tok_get_all: 38 (5.7%), b_comp_prob: 3.0 (0.4%), b_tok_touch_all: 39
	(5.8%), b_finish: 0.89 (0.1%), tests_pri_0: 469 (70.0%),
	check_dkim_signature: 0.68 (0.1%), check_dkim_adsp: 7 (1.0%),
	poll_dns_idle: 0.56 (0.1%), tests_pri_10: 2.1 (0.3%), tests_pri_500: 8
	(1.2%), rewrite_mail: 0.00 (0.0%)
Subject: [PATCH v2] binfmt_elf: Support segments with 0 filesz and
 misaligned starts
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)


Implement a helper elf_load that wraps elf_map and performs all
of the necessary work to ensure that when "memsz > filesz"
the bytes described by "memsz > filesz" are zeroed.

Link: https://lkml.kernel.org/r/20230914-bss-alloc-v1-1-78de67d2c6dd@weisss=
chuh.net
Reported-by: Sebastian Ott <sebott@redhat.com>
Reported-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
---
 fs/binfmt_elf.c | 111 +++++++++++++++++++++---------------------------
 1 file changed, 48 insertions(+), 63 deletions(-)

Dan Carpenter <dan.carpenter@linaro.org> writes:
> smatch warnings:
> fs/binfmt_elf.c:431 elf_load() error: uninitialized symbol 'map_addr'.

That was embarrassing.  I have added an initialization of map_error in
the p_filesz =3D=3D 0 case.

I am a bit surprised this worked without map_error being set in testing,
but it looks like any "value < TASK_SIZE" would work.  So I guess odds
are about 50/50 that any random stack value would not cause
load_elf_binary to fail.

Thanks for pointing that out.

Eric



diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 7b3d2d491407..2a615f476e44 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -110,25 +110,6 @@ static struct linux_binfmt elf_format =3D {
=20
 #define BAD_ADDR(x) (unlikely((unsigned long)(x) >=3D TASK_SIZE))
=20
-static int set_brk(unsigned long start, unsigned long end, int prot)
-{
-	start =3D ELF_PAGEALIGN(start);
-	end =3D ELF_PAGEALIGN(end);
-	if (end > start) {
-		/*
-		 * Map the last of the bss segment.
-		 * If the header is requesting these pages to be
-		 * executable, honour that (ppc32 needs this).
-		 */
-		int error =3D vm_brk_flags(start, end - start,
-				prot & PROT_EXEC ? VM_EXEC : 0);
-		if (error)
-			return error;
-	}
-	current->mm->start_brk =3D current->mm->brk =3D end;
-	return 0;
-}
-
 /* We need to explicitly zero any fractional pages
    after the data section (i.e. bss).  This would
    contain the junk from the file that should not
@@ -406,6 +387,51 @@ static unsigned long elf_map(struct file *filep, unsig=
ned long addr,
 	return(map_addr);
 }
=20
+static unsigned long elf_load(struct file *filep, unsigned long addr,
+		const struct elf_phdr *eppnt, int prot, int type,
+		unsigned long total_size)
+{
+	unsigned long zero_start, zero_end;
+	unsigned long map_addr;
+
+	if (eppnt->p_filesz) {
+		map_addr =3D elf_map(filep, addr, eppnt, prot, type, total_size);
+		if (BAD_ADDR(map_addr))
+			return map_addr;
+		if (eppnt->p_memsz > eppnt->p_filesz) {
+			zero_start =3D map_addr + ELF_PAGEOFFSET(eppnt->p_vaddr) +
+				eppnt->p_filesz;
+			zero_end =3D map_addr + ELF_PAGEOFFSET(eppnt->p_vaddr) +
+				eppnt->p_memsz;
+
+			/* Zero the end of the last mapped page */
+			padzero(zero_start);
+		}
+	} else {
+		map_addr =3D zero_start =3D ELF_PAGESTART(addr);
+		zero_end =3D zero_start + ELF_PAGEOFFSET(eppnt->p_vaddr) +
+			eppnt->p_memsz;
+	}
+	if (eppnt->p_memsz > eppnt->p_filesz) {
+		/*
+		 * Map the last of the segment.
+		 * If the header is requesting these pages to be
+		 * executable, honour that (ppc32 needs this).
+		 */
+		int error;
+
+		zero_start =3D ELF_PAGEALIGN(zero_start);
+		zero_end =3D ELF_PAGEALIGN(zero_end);
+
+		error =3D vm_brk_flags(zero_start, zero_end - zero_start,
+				     prot & PROT_EXEC ? VM_EXEC : 0);
+		if (error)
+			map_addr =3D error;
+	}
+	return map_addr;
+}
+
+
 static unsigned long total_mapping_size(const struct elf_phdr *phdr, int n=
r)
 {
 	elf_addr_t min_addr =3D -1;
@@ -829,7 +855,6 @@ static int load_elf_binary(struct linux_binprm *bprm)
 	struct elf_phdr *elf_ppnt, *elf_phdata, *interp_elf_phdata =3D NULL;
 	struct elf_phdr *elf_property_phdata =3D NULL;
 	unsigned long elf_bss, elf_brk;
-	int bss_prot =3D 0;
 	int retval, i;
 	unsigned long elf_entry;
 	unsigned long e_entry;
@@ -1040,33 +1065,6 @@ static int load_elf_binary(struct linux_binprm *bprm)
 		if (elf_ppnt->p_type !=3D PT_LOAD)
 			continue;
=20
-		if (unlikely (elf_brk > elf_bss)) {
-			unsigned long nbyte;
-
-			/* There was a PT_LOAD segment with p_memsz > p_filesz
-			   before this one. Map anonymous pages, if needed,
-			   and clear the area.  */
-			retval =3D set_brk(elf_bss + load_bias,
-					 elf_brk + load_bias,
-					 bss_prot);
-			if (retval)
-				goto out_free_dentry;
-			nbyte =3D ELF_PAGEOFFSET(elf_bss);
-			if (nbyte) {
-				nbyte =3D ELF_MIN_ALIGN - nbyte;
-				if (nbyte > elf_brk - elf_bss)
-					nbyte =3D elf_brk - elf_bss;
-				if (clear_user((void __user *)elf_bss +
-							load_bias, nbyte)) {
-					/*
-					 * This bss-zeroing can fail if the ELF
-					 * file specifies odd protections. So
-					 * we don't check the return value
-					 */
-				}
-			}
-		}
-
 		elf_prot =3D make_prot(elf_ppnt->p_flags, &arch_state,
 				     !!interpreter, false);
=20
@@ -1162,7 +1160,7 @@ static int load_elf_binary(struct linux_binprm *bprm)
 			}
 		}
=20
-		error =3D elf_map(bprm->file, load_bias + vaddr, elf_ppnt,
+		error =3D elf_load(bprm->file, load_bias + vaddr, elf_ppnt,
 				elf_prot, elf_flags, total_size);
 		if (BAD_ADDR(error)) {
 			retval =3D IS_ERR_VALUE(error) ?
@@ -1217,10 +1215,8 @@ static int load_elf_binary(struct linux_binprm *bprm)
 		if (end_data < k)
 			end_data =3D k;
 		k =3D elf_ppnt->p_vaddr + elf_ppnt->p_memsz;
-		if (k > elf_brk) {
-			bss_prot =3D elf_prot;
+		if (k > elf_brk)
 			elf_brk =3D k;
-		}
 	}
=20
 	e_entry =3D elf_ex->e_entry + load_bias;
@@ -1232,18 +1228,7 @@ static int load_elf_binary(struct linux_binprm *bprm)
 	start_data +=3D load_bias;
 	end_data +=3D load_bias;
=20
-	/* Calling set_brk effectively mmaps the pages that we need
-	 * for the bss and break sections.  We must do this before
-	 * mapping in the interpreter, to make sure it doesn't wind
-	 * up getting placed where the bss needs to go.
-	 */
-	retval =3D set_brk(elf_bss, elf_brk, bss_prot);
-	if (retval)
-		goto out_free_dentry;
-	if (likely(elf_bss !=3D elf_brk) && unlikely(padzero(elf_bss))) {
-		retval =3D -EFAULT; /* Nobody gets to see this, but.. */
-		goto out_free_dentry;
-	}
+	current->mm->start_brk =3D current->mm->brk =3D ELF_PAGEALIGN(elf_brk);
=20
 	if (interpreter) {
 		elf_entry =3D load_elf_interp(interp_elf_ex,
--=20
2.41.0


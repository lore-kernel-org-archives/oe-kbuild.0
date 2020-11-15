Content-Type: multipart/mixed; boundary="===============2661861826961044827=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm64/kvm/mmu.c:803:13: warning: Variable 'vma_shift' is reassigned a value before the old one has been used. 'break; '
Date: Sun, 15 Nov 2020 10:12:07 +0800
Message-ID: <202011151002.hcK9Ig5d-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2661861826961044827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Gavin Shan <gshan@redhat.com>
CC: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e28c0d7c92c89016c12a677616668957351e7542
commit: 2f40c46021bbb3ecd5c5f05764ecccbc276bc690 KVM: arm64: Use fallback m=
apping sizes for contiguous huge page sizes
date:   2 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 weeks ago
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm64/kvm/mmu.c:803:13: warning: Variable 'vma_shift' is reassigned=
 a value before the old one has been used. 'break;' missing? [redundantAssi=
gnInSwitch]
     vma_shift =3D PAGE_SHIFT;
               ^
   arch/arm64/kvm/mmu.c:796:13: note: Variable 'vma_shift' is reassigned a =
value before the old one has been used. 'break;' missing?
     vma_shift =3D PMD_SHIFT;
               ^
   arch/arm64/kvm/mmu.c:803:13: note: Variable 'vma_shift' is reassigned a =
value before the old one has been used. 'break;' missing?
     vma_shift =3D PAGE_SHIFT;
               ^

vim +803 arch/arm64/kvm/mmu.c

0529c9021252a58 arch/arm64/kvm/mmu.c Suzuki K Poulose  2020-05-07  740  =

94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  741  sta=
tic int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
98047888bb9fd57 arch/arm/kvm/mmu.c   Christoffer Dall  2014-08-19  742  			=
  struct kvm_memory_slot *memslot, unsigned long hva,
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  743  			=
  unsigned long fault_status)
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  744  {
ffd1b63a5860968 arch/arm64/kvm/mmu.c Will Deacon       2020-09-30  745  	in=
t ret =3D 0;
6396b852e46e562 virt/kvm/arm/mmu.c   Punit Agrawal     2018-12-11  746  	bo=
ol write_fault, writable, force_pte =3D false;
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  747  	bo=
ol exec_fault;
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  748  	bo=
ol device =3D false;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  749  	un=
signed long mmu_seq;
ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall  2012-11-01  750  	st=
ruct kvm *kvm =3D vcpu->kvm;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  751  	st=
ruct kvm_mmu_memory_cache *memcache =3D &vcpu->arch.mmu_page_cache;
ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall  2012-11-01  752  	st=
ruct vm_area_struct *vma;
1559b7583ff6ed0 virt/kvm/arm/mmu.c   James Morse       2019-12-17  753  	sh=
ort vma_shift;
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  754  	gf=
n_t gfn;
ba049e93aef7e8c arch/arm/kvm/mmu.c   Dan Williams      2016-01-15  755  	kv=
m_pfn_t pfn;
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch    2015-01-15  756  	bo=
ol logging_active =3D memslot_is_logging(memslot);
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  757  	un=
signed long vma_pagesize;
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  758  	en=
um kvm_pgtable_prot prot =3D KVM_PGTABLE_PROT_R;
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  759  	st=
ruct kvm_pgtable *pgt;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  760  =

a7d079cea2dffb1 arch/arm/kvm/mmu.c   Ard Biesheuvel    2014-09-09  761  	wr=
ite_fault =3D kvm_is_write_fault(vcpu);
d0e22b4ac3ba23c virt/kvm/arm/mmu.c   Marc Zyngier      2017-10-23  762  	ex=
ec_fault =3D kvm_vcpu_trap_is_iabt(vcpu);
d0e22b4ac3ba23c virt/kvm/arm/mmu.c   Marc Zyngier      2017-10-23  763  	VM=
_BUG_ON(write_fault && exec_fault);
d0e22b4ac3ba23c virt/kvm/arm/mmu.c   Marc Zyngier      2017-10-23  764  =

d0e22b4ac3ba23c virt/kvm/arm/mmu.c   Marc Zyngier      2017-10-23  765  	if=
 (fault_status =3D=3D FSC_PERM && !write_fault && !exec_fault) {
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  766  		k=
vm_err("Unexpected L2 read permission error\n");
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  767  		r=
eturn -EFAULT;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  768  	}
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  769  =

ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall  2012-11-01  770  	/*=
 Let's check if we will get back a huge page backed by hugetlbfs */
89154dd5313f774 arch/arm64/kvm/mmu.c Michel Lespinasse 2020-06-08  771  	mm=
ap_read_lock(current->mm);
ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall  2012-11-01  772  	vm=
a =3D find_vma_intersection(current->mm, hva, hva + 1);
37b544087ef3f65 arch/arm/kvm/mmu.c   Ard Biesheuvel    2014-09-17  773  	if=
 (unlikely(!vma)) {
37b544087ef3f65 arch/arm/kvm/mmu.c   Ard Biesheuvel    2014-09-17  774  		k=
vm_err("Failed to find VMA for hva 0x%lx\n", hva);
89154dd5313f774 arch/arm64/kvm/mmu.c Michel Lespinasse 2020-06-08  775  		m=
map_read_unlock(current->mm);
37b544087ef3f65 arch/arm/kvm/mmu.c   Ard Biesheuvel    2014-09-17  776  		r=
eturn -EFAULT;
37b544087ef3f65 arch/arm/kvm/mmu.c   Ard Biesheuvel    2014-09-17  777  	}
37b544087ef3f65 arch/arm/kvm/mmu.c   Ard Biesheuvel    2014-09-17  778  =

1559b7583ff6ed0 virt/kvm/arm/mmu.c   James Morse       2019-12-17  779  	if=
 (is_vm_hugetlb_page(vma))
1559b7583ff6ed0 virt/kvm/arm/mmu.c   James Morse       2019-12-17  780  		v=
ma_shift =3D huge_page_shift(hstate_vma(vma));
1559b7583ff6ed0 virt/kvm/arm/mmu.c   James Morse       2019-12-17  781  	el=
se
1559b7583ff6ed0 virt/kvm/arm/mmu.c   James Morse       2019-12-17  782  		v=
ma_shift =3D PAGE_SHIFT;
1559b7583ff6ed0 virt/kvm/arm/mmu.c   James Morse       2019-12-17  783  =

a80868f39855484 virt/kvm/arm/mmu.c   Suzuki K Poulose  2019-03-12  784  	if=
 (logging_active ||
523b3999e5f620c arch/arm64/kvm/mmu.c Alexandru Elisei  2020-09-10  785  	  =
  (vma->vm_flags & VM_PFNMAP)) {
a80868f39855484 virt/kvm/arm/mmu.c   Suzuki K Poulose  2019-03-12  786  		f=
orce_pte =3D true;
523b3999e5f620c arch/arm64/kvm/mmu.c Alexandru Elisei  2020-09-10  787  		v=
ma_shift =3D PAGE_SHIFT;
523b3999e5f620c arch/arm64/kvm/mmu.c Alexandru Elisei  2020-09-10  788  	}
523b3999e5f620c arch/arm64/kvm/mmu.c Alexandru Elisei  2020-09-10  789  =

2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  790  	sw=
itch (vma_shift) {
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  791  	ca=
se PUD_SHIFT:
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  792  		i=
f (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  793  			=
break;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  794  		f=
allthrough;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  795  	ca=
se CONT_PMD_SHIFT:
523b3999e5f620c arch/arm64/kvm/mmu.c Alexandru Elisei  2020-09-10  796  		v=
ma_shift =3D PMD_SHIFT;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  797  		f=
allthrough;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  798  	ca=
se PMD_SHIFT:
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  799  		i=
f (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE))
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  800  			=
break;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  801  		f=
allthrough;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  802  	ca=
se CONT_PTE_SHIFT:
523b3999e5f620c arch/arm64/kvm/mmu.c Alexandru Elisei  2020-09-10 @803  		v=
ma_shift =3D PAGE_SHIFT;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  804  		f=
orce_pte =3D true;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  805  		f=
allthrough;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  806  	ca=
se PAGE_SHIFT:
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  807  		b=
reak;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  808  	de=
fault:
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan        2020-10-26  809  		W=
ARN_ONCE(1, "Unknown vma_shift %d", vma_shift);
a80868f39855484 virt/kvm/arm/mmu.c   Suzuki K Poulose  2019-03-12  810  	}
a80868f39855484 virt/kvm/arm/mmu.c   Suzuki K Poulose  2019-03-12  811  =

523b3999e5f620c arch/arm64/kvm/mmu.c Alexandru Elisei  2020-09-10  812  	vm=
a_pagesize =3D 1UL << vma_shift;
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  813  	if=
 (vma_pagesize =3D=3D PMD_SIZE || vma_pagesize =3D=3D PUD_SIZE)
523b3999e5f620c arch/arm64/kvm/mmu.c Alexandru Elisei  2020-09-10  814  		f=
ault_ipa &=3D ~(vma_pagesize - 1);
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  815  =

6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  816  	gf=
n =3D fault_ipa >> PAGE_SHIFT;
89154dd5313f774 arch/arm64/kvm/mmu.c Michel Lespinasse 2020-06-08  817  	mm=
ap_read_unlock(current->mm);
ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall  2012-11-01  818  =

6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  819  	/*
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  820  	 *=
 Permission faults just need to update the existing leaf entry,
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  821  	 *=
 and so normally don't require allocations from the memcache. The
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  822  	 *=
 only exception to this is when dirty logging is enabled at runtime
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  823  	 *=
 and a write fault needs to collapse a block entry into a table.
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  824  	 */
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  825  	if=
 (fault_status !=3D FSC_PERM || (logging_active && write_fault)) {
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  826  		r=
et =3D kvm_mmu_topup_memory_cache(memcache,
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  827  			=
			 kvm_mmu_cache_min_pages(kvm));
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  828  		i=
f (ret)
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  829  			=
return ret;
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  830  	}
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  831  =

94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  832  	mm=
u_seq =3D vcpu->kvm->mmu_notifier_seq;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  833  	/*
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  834  	 *=
 Ensure the read of mmu_notifier_seq happens before we call
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  835  	 *=
 gfn_to_pfn_prot (which calls get_user_pages), so that we don't risk
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  836  	 *=
 the page we just got a reference to gets unmapped before we have a
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  837  	 *=
 chance to grab the mmu_lock, which ensure that if the page gets
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  838  	 *=
 unmapped afterwards, the call to kvm_unmap_hva will take it away
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  839  	 *=
 from us again properly. This smp_rmb() interacts with the smp_wmb()
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  840  	 *=
 in kvm_mmu_notifier_invalidate_<page|range_end>.
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  841  	 */
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  842  	sm=
p_rmb();
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  843  =

ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall  2012-11-01  844  	pf=
n =3D gfn_to_pfn_prot(kvm, gfn, write_fault, &writable);
196f878a7ac2e72 virt/kvm/arm/mmu.c   James Morse       2017-06-20  845  	if=
 (pfn =3D=3D KVM_PFN_ERR_HWPOISON) {
1559b7583ff6ed0 virt/kvm/arm/mmu.c   James Morse       2019-12-17  846  		k=
vm_send_hwpoison_signal(hva, vma_shift);
196f878a7ac2e72 virt/kvm/arm/mmu.c   James Morse       2017-06-20  847  		r=
eturn 0;
196f878a7ac2e72 virt/kvm/arm/mmu.c   James Morse       2017-06-20  848  	}
9ac715954682b23 arch/arm/kvm/mmu.c   Christoffer Dall  2016-08-17  849  	if=
 (is_error_noslot_pfn(pfn))
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  850  		r=
eturn -EFAULT;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  851  =

15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch    2015-01-15  852  	if=
 (kvm_is_device_pfn(pfn)) {
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  853  		d=
evice =3D true;
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  854  	} =
else if (logging_active && !write_fault) {
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch    2015-01-15  855  		/*
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch    2015-01-15  856  		 =
* Only actually map the page as writable if this was a write
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch    2015-01-15  857  		 =
* fault.
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch    2015-01-15  858  		 =
*/
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch    2015-01-15  859  		w=
ritable =3D false;
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch    2015-01-15  860  	}
b88657674d39fc2 arch/arm/kvm/mmu.c   Kim Phillips      2014-06-26  861  =

6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  862  	if=
 (exec_fault && device)
6d674e28f642e3f virt/kvm/arm/mmu.c   Marc Zyngier      2019-12-11  863  		r=
eturn -ENOEXEC;
6d674e28f642e3f virt/kvm/arm/mmu.c   Marc Zyngier      2019-12-11  864  =

ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall  2012-11-01  865  	sp=
in_lock(&kvm->mmu_lock);
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  866  	pg=
t =3D vcpu->arch.hw_mmu->pgt;
ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall  2012-11-01  867  	if=
 (mmu_notifier_retry(kvm, mmu_seq))
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  868  		g=
oto out_unlock;
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch    2015-01-15  869  =

3f58bf63455588a virt/kvm/arm/mmu.c   Punit Agrawal     2018-12-11  870  	/*
0529c9021252a58 arch/arm64/kvm/mmu.c Suzuki K Poulose  2020-05-07  871  	 *=
 If we are not forced to use page mapping, check if we are
0529c9021252a58 arch/arm64/kvm/mmu.c Suzuki K Poulose  2020-05-07  872  	 *=
 backed by a THP and thus use block mapping if possible.
3f58bf63455588a virt/kvm/arm/mmu.c   Punit Agrawal     2018-12-11  873  	 */
0529c9021252a58 arch/arm64/kvm/mmu.c Suzuki K Poulose  2020-05-07  874  	if=
 (vma_pagesize =3D=3D PAGE_SIZE && !force_pte)
0529c9021252a58 arch/arm64/kvm/mmu.c Suzuki K Poulose  2020-05-07  875  		v=
ma_pagesize =3D transparent_hugepage_adjust(memslot, hva,
0529c9021252a58 arch/arm64/kvm/mmu.c Suzuki K Poulose  2020-05-07  876  			=
				   &pfn, &fault_ipa);
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  877  	if=
 (writable) {
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  878  		p=
rot |=3D KVM_PGTABLE_PROT_W;
ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall  2012-11-01  879  		k=
vm_set_pfn_dirty(pfn);
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  880  		m=
ark_page_dirty(kvm, gfn);
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  881  	}
a9c0e12ebee56ef virt/kvm/arm/mmu.c   Marc Zyngier      2017-10-23  882  =

6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  883  	if=
 (fault_status !=3D FSC_PERM && !device)
3f58bf63455588a virt/kvm/arm/mmu.c   Punit Agrawal     2018-12-11  884  		c=
lean_dcache_guest_page(pfn, vma_pagesize);
3f58bf63455588a virt/kvm/arm/mmu.c   Punit Agrawal     2018-12-11  885  =

6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  886  	if=
 (exec_fault) {
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  887  		p=
rot |=3D KVM_PGTABLE_PROT_X;
3f58bf63455588a virt/kvm/arm/mmu.c   Punit Agrawal     2018-12-11  888  		i=
nvalidate_icache_guest_page(pfn, vma_pagesize);
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  889  	}
a9c0e12ebee56ef virt/kvm/arm/mmu.c   Marc Zyngier      2017-10-23  890  =

6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  891  	if=
 (device)
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  892  		p=
rot |=3D KVM_PGTABLE_PROT_DEVICE;
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  893  	el=
se if (cpus_have_const_cap(ARM64_HAS_CACHE_DIC))
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  894  		p=
rot |=3D KVM_PGTABLE_PROT_X;
a15f693935a9f1f virt/kvm/arm/mmu.c   Marc Zyngier      2017-10-23  895  =

6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  896  	if=
 (fault_status =3D=3D FSC_PERM && !(logging_active && writable)) {
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  897  		r=
et =3D kvm_pgtable_stage2_relax_perms(pgt, fault_ipa, prot);
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  898  	} =
else {
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  899  		r=
et =3D kvm_pgtable_stage2_map(pgt, fault_ipa, vma_pagesize,
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  900  			=
		     __pfn_to_phys(pfn), prot,
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon       2020-09-11  901  			=
		     memcache);
ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall  2012-11-01  902  	}
ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall  2012-11-01  903  =

94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  904  out=
_unlock:
ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall  2012-11-01  905  	sp=
in_unlock(&kvm->mmu_lock);
35307b9a5f7ebcc arch/arm/kvm/mmu.c   Marc Zyngier      2015-03-12  906  	kv=
m_set_pfn_accessed(pfn);
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  907  	kv=
m_release_pfn_clean(pfn);
ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall  2012-11-01  908  	re=
turn ret;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  909  }
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall  2013-01-20  910  =


:::::: The code at line 803 was first introduced by commit
:::::: 523b3999e5f620cb5ccce6a7ca2780a4cab579a2 KVM: arm64: Try PMD block m=
appings if PUD mappings are not supported

:::::: TO: Alexandru Elisei <alexandru.elisei@arm.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2661861826961044827==--


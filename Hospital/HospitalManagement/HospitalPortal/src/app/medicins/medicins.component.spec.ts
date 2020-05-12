import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MedicinsComponent } from './medicins.component';

describe('MedicinsComponent', () => {
  let component: MedicinsComponent;
  let fixture: ComponentFixture<MedicinsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MedicinsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MedicinsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

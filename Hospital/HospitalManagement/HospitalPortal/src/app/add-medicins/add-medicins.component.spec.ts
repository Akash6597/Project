import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AddMedicinsComponent } from './add-medicins.component';

describe('AddMedicinsComponent', () => {
  let component: AddMedicinsComponent;
  let fixture: ComponentFixture<AddMedicinsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AddMedicinsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AddMedicinsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
